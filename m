Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6650CB894A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 04:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405343AbfITC2Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 22:28:25 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:5374
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405325AbfITC2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 22:28:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/As8Mf9SvH1YsHgxH+Nuh22HvnwLx/zw4PZdeAjJIkRdTRKLDyYI53nRfaS1NOQNOl/TKwOochXHtPk50yBYZxpMHxUtGXm39T83D5dnQSguddf8dVn9weYBe7FP02/XL3TPvNU7tQt3sQt9t9gXVVhSHhV7CoUr0qnFn3Cp1cwl9lOUevL1g8CCyvs0Rfl6ZfwH9DDOv8wUgVocOs/Giyi0aAS037soGiTonSc399kCmFWMDoIW3I8Ov571WrC3zpcU4ZzBhgwhNOD35CEpt8lv0UlIME94dwVekW/G6A4sW+UEuNY2YdrsYu+GCYBr2JCLawFCjjQZy227KvW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6GLn1bLvoNx/gfbb+hzej4Iazl3xs5j/m/EskdX5Q0=;
 b=hfzM6Gpmnl1ghYO+XkIxkrKCzVI5dcgj7ZTgnIPMOnp+xhUV7E/3WXxXQfgMw8R9E7sQz4tWN3gNJy0oJfr+4y/1BKTw8bQG71NrCD2l7/9IMHx8BL50YhwvPxwFbyW62V3xmWcJk1rwteOxbtZUcjPkSZgk8BcHnO0PpPbZmo6mjFpW+mByn5d2VCIyL57blWkxgrS5fvJw4kUrMJAqomoQOk17CVekqIhshDW7uKBpUfMsLucYWcOne3SOXPLDne6v3TqUI1S0oAA2ntlJWaLwKhz/mMJBSr80ogKLw6qNANpWkWUI+UOK/LhEnH/VJJ3+bVWAEi8YkSzEB5j8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6GLn1bLvoNx/gfbb+hzej4Iazl3xs5j/m/EskdX5Q0=;
 b=ku4MJ8HVeHCI3IAmq4r2jJawdozmQEHzMACTH36HVaHEUsHkVOmXyejnwDmM4G3kheCJY0Qu9AFqBr2AzPe42bAR9dINtqBNBxB+4AUgUE6QdBXG+7B0TDqSe7/vNr/Z+H1tEAYJwmn+9fg7WcjPO9HfteAYEPXyiSKPWFfcVfs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3950.jpnprd01.prod.outlook.com (20.178.138.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Fri, 20 Sep 2019 02:28:20 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2263.023; Fri, 20 Sep 2019
 02:28:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: RE: [PATCH v5 2/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Topic: [PATCH v5 2/3] usb: renesas_usbhs: enable DVSE interrupt
Thread-Index: AQHVaKNcDc9CalA0GkiNgPTLo3Kouacz5KSg
Date:   Fri, 20 Sep 2019 02:28:19 +0000
Message-ID: <TYAPR01MB4544343D0BAAA77086D4E494D8880@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568207756-22325-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568207756-22325-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1568207756-22325-2-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a89d0b2-2170-4b9c-453b-08d73d7233b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3950;
x-ms-traffictypediagnostic: TYAPR01MB3950:|TYAPR01MB3950:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB3950D4C75AFB71CA2E7B63E1D8880@TYAPR01MB3950.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(6506007)(66946007)(14454004)(99286004)(107886003)(74316002)(2906002)(6306002)(55016002)(446003)(26005)(186003)(14444005)(6436002)(7696005)(71200400001)(86362001)(102836004)(76176011)(5660300002)(11346002)(7736002)(256004)(9686003)(305945005)(52536014)(81166006)(71190400001)(4326008)(966005)(66066001)(229853002)(486006)(8936002)(3846002)(33656002)(81156014)(316002)(64756008)(110136005)(6246003)(76116006)(25786009)(54906003)(8676002)(478600001)(476003)(66476007)(66446008)(6116002)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3950;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /sPy5Bxsa+Dsssa0mcDzxfTekdeKdxaKGOe6m3PfF3HP/ouKpHxyC1HwXdKNvGnDF0MeYA+U62Yb3ZB6z4KphxhLoeodA6JLoSv7PMKC9NGmmlwfeYOsFIWNjUG5geqKW3eBwl01ZIeG4OB1i/iQVcWcPMMN/TE/103QHlP22eTqxbPmhlBIkdyLb6fGDFFrfHbqIdh6VzwQeSoUygK931tLDEudXh9/WYfOEWMShw7/8YOD/Q/y/sjvPTGttWYOYNTsNC7UIdfCFgxas+5Ar6jgMsExDer2ENjaj7lPGMLnkQ63lxtWu6QpnhaqSfcnjCB9nEdpKU2B5JwUUW2ohYWpeCZI6svEFcxerVnM2rgm8QSfRYb8E4r3QCvk9Dwrc2VWW0ithciIUGlfBfmyiO+iKoC+f+np7dwWe9S3di4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a89d0b2-2170-4b9c-453b-08d73d7233b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 02:28:19.8641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hnTkjzN9MVHKlLf+A9sTQimTrHMNHN7hy9SS2xTIgcJYghE1fb/tL8x4fzEupSu+3b/UUfMHipxDniNinTjNvQupTicP5CXFCDc7pWCaH95Uxlq6z/dPUaW5ppOAtQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3950
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan-san,

> From: Veeraiyan Chidambaram, Sent: Wednesday, September 11, 2019 10:16 PM
>=20
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>=20
> Commit [1] enabled the possibility of checking the DVST (Device State
> Transition) bit of INTSTS0 (Interrupt Status Register 0) and calling
> the irq_dev_state() handler if the DVST bit is set. But neither
> commit [1] nor commit [2] actually enabled the DVSE (Device State
> Transition Interrupt Enable) bit in the INTENB0 (Interrupt Enable
> Register 0). As a consequence, irq_dev_state() handler is getting
> called as a side effect of other (non-DVSE) interrupts being fired,
> which definitely can't be relied upon, if DVST notifications are of
> any value.
>=20
> Why this doesn't hurt is because usbhsg_irq_dev_state() currently
> doesn't do much except of a dev_dbg(). Once more work is added to
> the handler (e.g. detecting device "Suspended" state and notifying
> other USB gadget components about it), enabling DVSE becomes a hard
> requirement. Do it in a standalone commit for better visibility and
> clear explanation.
>=20
> [1] commit f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common
>    code")
> [2] commit 2f98382dcdfe ("usb: renesas_usbhs: Add Renesas USBHS Gadget")
>=20
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> ---
> v5: fixed checkpatch warning
> v4: https://patchwork.kernel.org/patch/11138201/

Thank you for the patch. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

