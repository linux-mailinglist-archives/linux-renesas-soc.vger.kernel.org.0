Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED5E967658C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 11:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjAUKAC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 05:00:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjAUKAB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 05:00:01 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2097.outbound.protection.outlook.com [40.107.113.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507FA654E7;
        Sat, 21 Jan 2023 01:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABi3652wb4MqLjpSoK1gf0bfINv1R47c7trMQqzYwQqsufPwPk6vpHlIrmkV1Mee15p6fByKMIHzpJgoVpWgl+Br0QX+ihqkU/nUXPe7jsSCodHUOBC3S8vWckm29r/yfqlqb9pSPAVjzZnLBt1Yiadln2i1ajjxO4xJ5mV82f37rZTNClQu3Y4Z4BFoPpHhPEcXj+uI8mNuF+6nzcwVG42JcgK3AQCRj+L3soaEwT26vM5456X20rEV95r+sB8mvxgsDN4C+MvoNPQJzmE04XEazgLn9/xLvLxvXDg+pU0QCH02lyLVw1oSxBrNlZTOTlOqCygO+X9ZFotUJQcZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mn55G+xsXFOejMpEFqo0BRdi05Lln+05lchol+azjDQ=;
 b=ZibOwKfH0AlQtYcncdpP/1goI+0DBpOFl1T7jgWZSg3MHuoysp27pJtOkbsLib/jLpoBjSFQX66dMnyY22+TrYhjveDeO59t7/4Tyg8RuzjW92V77gdUlMek6uWyVWctf9O7tRZYjNJ4rwmoX6ZRo4cc4AwygysTMC9sFZImKEjO17Gkj9Ftext5KPZiI/EbWMPu0XQSUPhM0rq0L5I7zUUkZfweQWYmw4eOfAPz8NW7zMvsO8uvb6vnGoqnn/Q6uoCH2lwUKGRYPIncwRfF+myhwTyhx9HIS9ASRTvV56H9GqKrpPSD9TFBH+IG4wuNFnzA6FRE4VvRX08FrO2G/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mn55G+xsXFOejMpEFqo0BRdi05Lln+05lchol+azjDQ=;
 b=HNiZQg05lbFJaB8Jo0QzSRXvZmo1t4Nep+m3b8FuXrt63pEXO0QY0lH2tDFEEFop0t1r//IY9M1b9VM2Ntcvxh8DfEETLu0IewFw5QwkEwTaU90c/NPTdyYPIee/AL/n7YeTytvFT2fpWl1KvvSk/oukPtOo0o2EkDTEP0AJ/Qw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9744.jpnprd01.prod.outlook.com (2603:1096:400:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sat, 21 Jan
 2023 09:59:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%5]) with mapi id 15.20.6002.027; Sat, 21 Jan 2023
 09:59:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Thread-Topic: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Thread-Index: AQHZJtEcTRod+bKVFE6v1GvnSXhjTK6lwQkAgALtIWA=
Date:   Sat, 21 Jan 2023 09:59:53 +0000
Message-ID: <OS0PR01MB59221827031B393F6FB693E786CA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
 <Y8lBKKPjci7+goiV@kroah.com>
In-Reply-To: <Y8lBKKPjci7+goiV@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9744:EE_
x-ms-office365-filtering-correlation-id: 89c3f5d2-39a5-405b-7cfb-08dafb963e56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfCzTZLyLpf6x+hijlvCCd22GkwClzauvcbLxuHvXo4zPfS97fT3JaPrXFpCWMRMTyE2IFEDesF1D9JNprz4H67FyiRByv1toFxrnPv0+p+oxcGeVuGInv/4DbG/1VMgMqDPohRvngsqoTbefuQP/A6mGFl7nIzRxBIP21+Tt97iZZJBbEy3GCRN/5kAG/VxanFXN2nKPyrEgdAbALr75WgbL9oswZpV9aBP8QcTJW0wj6DIyB6JgTs8SZBnQCX7ltCNViUpwnLe+577obWWR+QQC2H2H04T2NlNe2immJ+ls/oR28pmB0QnqPVR0ASJ4OoJT2ZzB05u+8qCAvXg297i/30bwyVZZRDLjp051Kh9szMZ5Xrb4kGKj9kNXsAKytJpMf2eCXDYqPCpPPuF1SX9ICAEshLsGr+mGlPzPW8n9j/hBD6LbvJ3NbtL9duF/CgSPKFrCb9GIfhmPkIABO3x3mS5RZ1JRk3eCxiqnAhEQImRookFSjVuJzUdgmn+m/ipX7rEDhkMWbVxHroM4YrPMLSTxV1O2mxcwcAG7oz165QGhOVQkH8S00ZKBN4BbQk5035qrTmoqYT879Ih64DYhnaFuK/kzYuSg6SPq3uc8ppIuPTToK8uJPVV0sssPOd9lMx0vABtEZx+IaoE52gf7jxZL+1T/Lm9UWgbhXXnSMOsJGgD3BpGW5R4oxHkrfIrDQ/qCjnMbl/ZxxeKiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(86362001)(38070700005)(55016003)(33656002)(54906003)(316002)(76116006)(8676002)(38100700002)(64756008)(6916009)(4326008)(66476007)(66446008)(66946007)(66556008)(9686003)(186003)(26005)(478600001)(6506007)(71200400001)(7696005)(122000001)(8936002)(41300700001)(83380400001)(52536014)(2906002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CPGIVnuzkucINH3hvQvvz2mJ+a1DPk+DVqZfJfS8nWfXewiWu8S2WfDFEMcE?=
 =?us-ascii?Q?yZhhve6zOkgaud9RZG7PnAUrkycXt2tOKAVJiy2XMj/aVf3pakWp63Pq2FD7?=
 =?us-ascii?Q?LJHjPJC+/E6TM0cfShqJYyTKEES8IeWwSI/XNYO3QJdZog7V3exZSSvZ0oa0?=
 =?us-ascii?Q?Opwge8hRFRmMsLASKzmf4mMSJbrUX/TD8KXoAotOXkZUIhdCokfMx8Jfije1?=
 =?us-ascii?Q?OCF98Ib98IGkkIpHGODiCjucydTbSN5Bfk1v1AUAPKuJUAtwdySaYl9jHkYW?=
 =?us-ascii?Q?tcswQ5xiof6ZCawNAYneuTdplaGnJjqtSCGIlIh1mDdP2OSSxe692K2VkKaP?=
 =?us-ascii?Q?bLHgquRwM/+xPH+HBJfFFPSHkW9trhoBsVaXf6RF5IFARjdaIwqLwWIYyye6?=
 =?us-ascii?Q?OaO+n1dq6es86dyt05p13G854zjdXATI3KzkMz3ch/0x70jJJiApP284acLw?=
 =?us-ascii?Q?U5mUV/jitTISFGVTK+z+zJLTgsyRJ02LCFMkbSwcPv9xbaOiYLsnMLmfC9BT?=
 =?us-ascii?Q?fs+oeOk3GjV4x9xRXBf600PKuwPS1Ihz0WvluOxa7YVPyX2MT3249ucpjgWQ?=
 =?us-ascii?Q?6RdsoJK7Fy97/9XbeziD5Cygpny8L/uKLLq+rsRk2PzQZ4vKptMa3cDAeMVP?=
 =?us-ascii?Q?MEdQZGIYDWw8fRsEGZMLwJdJ9ckKBS+P6te2R+ndheZTLSTeUmHgLJNPEqY/?=
 =?us-ascii?Q?p8RFstxRmkw0EUJXQ9Hn0/GIK/pJDt9AUsFFaB/DBywKslAgtrXFkdfeXBfl?=
 =?us-ascii?Q?bGsbJRzfnfxwVwTHHcm29gJ4/5uwagazB6CVWnvY/bXTlN4mR+GDVa9dAiFy?=
 =?us-ascii?Q?dcI71EhojeResNtRcvpzE+9iz7Z9Tm9DhhKPP72vJkWMZeXiOIiV7YBuhbpK?=
 =?us-ascii?Q?MfqNzVlWnXxziCsoYsfpkgsgosq/V0JLU1NsNfTOHsWY4NFB4xld+8xiy1l5?=
 =?us-ascii?Q?wUGXrx+aerqQQu1W768xFmbG0fvg+YZZG2YkS16GaZnXt8nob1zMEIruX4l0?=
 =?us-ascii?Q?q1Uvp13jHAkQCgN4KscYQJH4Sh0fCWvjjxF1buhubPRGvdniRX+RyfXwANA9?=
 =?us-ascii?Q?cRI4MsmeWyns3vVgzOZuVWNycvDSrMBAOzKE5gvqwU5e8P+Jy/PuFPPN5J67?=
 =?us-ascii?Q?LYOcyMBkI435qe2wHV3VkulBOC37Anm6i6TfKL0xGBEestB8M0ugPAxNObAf?=
 =?us-ascii?Q?M5jJ6lHJ1Jo6cV4o1458yPnIQfqQcukW2QP3+xFMnOkKM8BJpZgR6niRyBwW?=
 =?us-ascii?Q?NQ7JZHJ9OjBQXsWxC0HM5h8Flw4ptUU7jmcLmXQIy4AWtEOd5+WRGE72K2sX?=
 =?us-ascii?Q?vz5BTSg24nmZDSkGdviN7cTwxYRxVBL4A/HMJ6wsXuO7eS0T07pzwih/q41i?=
 =?us-ascii?Q?yHTdsp6iVMuIHcls9Ms/wuhHu8890k5GFJNkWc/OmGkLZ/jMuMaWMlE4i87C?=
 =?us-ascii?Q?rLPkdT5VGkal4+uLGaBgGhRAhjO9myhHmQHmXjFAe3dREPuYhg9FiGkI79HG?=
 =?us-ascii?Q?2KLh+Rp2UJAp4mDwcSxs+yDWmthZZbMkNVFOtSMzSUBDG+hnjKx+15q+2CoE?=
 =?us-ascii?Q?2UDnjHIhH43HbxdWmsbUEfkq7LxYkLK2KrbQZhncVBOc3kbPnAcvdePnm2ye?=
 =?us-ascii?Q?1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c3f5d2-39a5-405b-7cfb-08dafb963e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2023 09:59:53.5243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53tE7W29ffAS8q7NI8jM0R2NvlOkKdPHCqsLxjvTcl9GkHD+BwUcO52+NodzNh/BUeI5FrPt2EGT6oRvDyWVH3/OV3gM5I9vPTlNwOVtPbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9744
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
>=20
> On Thu, Jan 12, 2023 at 09:58:54PM +0000, Biju Das wrote:
> > This patch series aims to add USB3.1 HOST, Peri and DRD support on
> > RZ/V2M EVK platform.
> >
> > The reset for both host and peri are located in USB3DRD block. The
> > USB3DRD registers are mapped in the AXI address space of the
> > Peripheral module.
> >
> > RZ/V2M XHCI is similar to R-Car XHCI but it doesn't require any
> > firmware.
> >
> > Host/device needs to do reset release and set the host/device function
> > on DRD module, before accessing any registers.
>=20
> After applying this series and building it on x86_64 I get the following
> build errors:
>=20
> ERROR: modpost: "rzv2m_usb3drd_reset" [drivers/usb/host/xhci-plat-hcd.ko]
> undefined!
> ERROR: modpost: "rzv2m_usb3drd_reset"
> [drivers/usb/gadget/udc/renesas_usb3.ko] undefined!

The file drivers/usb/gadget/udc/rzv2m_usb3drd.c is not getting compiled,

If USB_RZV2M_USB3DRD=3Dy, USB_XHCI_RZV2M=3Dm and USB_RENESAS_USB3=3Dm and=20
Because of that modpost is giving undefined error.

So I have updated the KCONFIG like below and now it builds OK now. I will s=
end next version
based on this, if there are no comments.

-- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -180,10 +180,17 @@ config USB_RENESAS_USBHS_UDC
           gadget drivers to also be dynamically linked.
=20
 config USB_RZV2M_USB3DRD
+       tristate 'Renesas USB3.1 DRD controller'
        depends on ARCH_R9A09G011 || COMPILE_TEST
-       bool
-       default y if USB_XHCI_RZV2M
-       default y if USB_RENESAS_USB3
+       default y if USB_XHCI_RZV2M=3Dy
+       default y if USB_RENESAS_USB3=3Dy
+       default m if (USB_XHCI_RZV2M=3Dm && USB_RENESAS_USB3=3Dm)
+       help
+          Renesas USB3.1 DRD controller is a USB DRD controller
+          that supports both host and device switching.
+
+          Say "y" to link the driver statically, or "m" to build a
+          dynamically linked module called "rzv2m_usb3drd".
=20
 config USB_RENESAS_USB3
        tristate 'Renesas USB3.0 Peripheral controller'
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 7414facce10f..2b80ce9587c1 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -54,6 +54,7 @@ config USB_XHCI_PCI_RENESAS
 config USB_XHCI_PLATFORM
        tristate "Generic xHCI driver for a platform device"
        select USB_XHCI_RCAR if ARCH_RENESAS
+       select USB_XHCI_RZV2M if ARCH_R9A09G011

Cheers,
Biju
