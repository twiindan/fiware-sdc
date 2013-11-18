/**
 * (c) Copyright 2013 Telefonica, I+D. Printed in Spain (Europe). All Rights Reserved.<br>
 * The copyright to the software program(s) is property of Telefonica I+D. The program(s) may be used and or copied only
 * with the express written consent of Telefonica I+D or in accordance with the terms and conditions stipulated in the
 * agreement/contract under which the program(s) have been supplied.
 */

package com.telefonica.euro_iaas.sdc.puppetwrapper.data;

import com.telefonica.euro_iaas.sdc.puppetwrapper.common.Action;

public class Software {

    private String eol = System.getProperty("line.separator");

    private String name;
    private String version;
    private Action action;

    public Software() {
        
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Action getAction() {
        return action;
    }

    public void setAction(Action action) {
        this.action = action;
    }

    /**
     * Constructs a <code>String</code> with all attributes in name = value
     * format.
     * 
     * @return a <code>String</code> representation of this object.
     */
    public String toString() {
        final String TAB = "    ";

        String retValue = "";

        retValue = "Software ( " + super.toString() + TAB + "name = " + this.name + TAB + "version = " + this.version
                + TAB + "action = " + this.action + TAB + " )";

        return retValue;
    }

    public String generateFileStr() {
        StringBuffer sb = new StringBuffer();
        sb.append("  class{'" + this.name + "::" + action.getActionString(action.getCode()) + "':");
        sb.append(eol);
        sb.append("   version => '" + version + "',");
        sb.append(eol);
        sb.append("  }");
        sb.append(eol);

        return sb.toString();

    }

}