Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189E0C9F13
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 15:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729601AbfJCNGh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 09:06:37 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:51500
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729486AbfJCNGh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 09:06:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOQZIO5mqedtoje/MDaEEaXVn6RRNye6X3S5cjPO0LmiU3rskcDODF34FitrzzwsQCl4/QcCwllzyiipDWdTVQEjIhQSnpE2xRJ1SMQkMXkjMhSzeqBjNNiOVVIUQ+rcFYeLp8HW0NMUoyIzd79SDetjSs5ZBXvZxWzd3SQjxZA6JofV+iVFfpRvvmYy5MCcQmecTbugjC+6vJXg7dhFRMQOxRwwbU4NJr76lookl70rBkHisMHU6QyTSIQOYtc2Wzl5hlE8avKJTI4GslEMjLKHOrPAx51CyDjNRQryYhEReY58kXNcGtbKlEPJLn2uL0te+qvS9ylE0MCfBV1b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKaQHQQ0vLwwyOiOqKcezr4yrS52YKKd0dH7tNEPnOE=;
 b=JodKmeHrP9kSAEO4G9FVnWyIdLuvqhv6rlk8a6lJilOwa0AsvJxSa4QuxEqR//+Y6gAcw9TKbEXStDkQ07irlKYs6J1du9hI+1bZC5fS2ZTh6881/J9VAp80T9v2U43y2WoIIdzQtNwEzMVP7HwQwlaGCEA4ceTbn4fzTVAALi+Q7DdKFEKDc2uxwf0lbSJ0/KQH76SXy0XQYHraEw2Yk4841SPnCG7wgkUebCEnE+gRd/dQbbc3U50m+BZO8Pw4xdoIAOQBtSDrUyclhQ+0cd0fyNNaEexsSp5Dmw34SU2nofhg4pA2mL1YIAvMyil/WGXGCj9/rsXVl1j9AwqBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKaQHQQ0vLwwyOiOqKcezr4yrS52YKKd0dH7tNEPnOE=;
 b=JcaxGrTP2lowWkVpGfKlFUO5R3mY786nalCARXtebcDI1WkIibmklWUP290vBCMMaXdYkEjSFhLhj15Di/5DgbVOM89QlYsYdbt/5I0qKVgibVNy/1OkAwXaKUcMpoPPJ4GZag/B+CysP/zj8wb7L2zXz2PqpMJnXbQsZHTgAdA=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3911.jpnprd01.prod.outlook.com (20.178.97.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 13:06:32 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.022; Thu, 3 Oct 2019
 13:06:32 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RESEND v7 0/3] Add USB3.0 and TI HD3SS3220 driver support
Thread-Topic: [PATCH RESEND v7 0/3] Add USB3.0 and TI HD3SS3220 driver support
Thread-Index: AQHVYvnhWtcTXbWliE+hANivkm65EadJD3qg
Date:   Thu, 3 Oct 2019 13:06:31 +0000
Message-ID: <OSBPR01MB21033E657CB361169BE71D51B89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7769395-2de7-4bbf-719c-08d748028341
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB3911:|OSBPR01MB3911:
x-ms-exchange-purlcount: 14
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB39115D4D4CE2835E50ED58FDB89F0@OSBPR01MB3911.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(13464003)(5660300002)(7416002)(2906002)(52536014)(3846002)(6116002)(86362001)(71200400001)(486006)(44832011)(71190400001)(476003)(256004)(14444005)(66556008)(66476007)(66946007)(64756008)(66446008)(76116006)(33656002)(99286004)(446003)(11346002)(102836004)(7696005)(76176011)(6506007)(53546011)(186003)(26005)(9686003)(305945005)(6306002)(966005)(8676002)(55016002)(81166006)(6246003)(81156014)(4326008)(25786009)(14454004)(8936002)(316002)(478600001)(74316002)(110136005)(66066001)(229853002)(54906003)(6436002)(7736002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3911;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yp5MbmNQOOU1HBPp/0hshrtDOiC3XrKtuZDRSI0t3g/vfc2qZ9YrbXwOQVRxo6WgGqlTXsOegCYaXsTQyufu0u4F2oWOXjxPVihpIDuuxCKA6OBUCx7yG2gPpzDn0EOTNwUCCshw8iC+hIwB3/DaW/63T4hNBIs/4D3b19MFkHubBmXLF3dc2xQvCyT3Fv7iqkl85aPN1nm2F1HenmDTQ9aV8oBqwi+rULQMpdSnLm+UR1oe3BDOgFI5Ba2yqk2mINA4qXNyg/pYYc9jtJp+EOVT8B4ytnCXNQ06SOutTCesb9xb5m5SiQIy6Fn43pLlwbzbAvX1LSUod68rxtaHs8wKv0iibDz6caatpwyeaLr9YER2yBLoKxJ2Ycaz3qy1b18xulpL5fsfu8IsOg95JpFL0inkHosopVmtONJuN4D1diRzuw2U5J2rxW+h/L/siJDZuMxWKOW+jckgoEvn7w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7769395-2de7-4bbf-719c-08d748028341
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 13:06:32.2514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2FGGqBPY38MF7TIlYgwUBuvwWv/S/luyxIqNwfzpf/87IyAAp5FzoAcj1J8GXPBwF9jXAWf8tfa/5xAIXQ6Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3911
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Polite reminder. =20

Are happy with the below patch series, since the dependency patches hit on =
mainline 5.4-rc1?

https://patchwork.kernel.org/project/linux-usb/list/?series=3D169305

regards,
Biju



> -----Original Message-----
> From: Biju Das <biju.das@bp.renesas.com>
> Sent: Wednesday, September 4, 2019 9:16 AM
> To: Rob Herring <robh+dt@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; Felipe Balbi <balbi@kernel.org>; Mark
> Rutland <mark.rutland@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; Simon Horman <horms@verge.net.au>;
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH RESEND v7 0/3] Add USB3.0 and TI HD3SS3220 driver support
>=20
> This series adds USB 3.0 support for the CAT874 platform, including a new
> driver for the TI HD3SS3220 USB Type-C DRP port controller.
>=20
> Patch4-7 on the v7 series been accepted and is in linux-rc tree.
> Resending patch 1-3 of v7 series, since the dependency patches [1],
> [2],[3],[4] is accpted for usb-next.
>=20
> This patchset is based on usb-next tree.
>=20
> [1] commit 451d15a1731c7db9d4868 ("dt-binding: usb: add usb-role-switch
> property") [2] commit 977607653cdd06a2c4d1d ("usb: roles: Introduce stubs
> for the exiting functions in role.h") [3] commit 44493062abc38e5895e0c
> ("device connection: Add fwnode_connection_find_match()") [4] commit
> a31f01777bc54a0a9d576 ("usb: roles: Add fwnode_usb_role_switch_get()
> function")
>=20
> V7-->V7 RESEND
>   * No change
>     (https://patchwork.kernel.org/patch/10969911/)
> V6-->V7
>   * Rebased on the below patch series
>     (https://patchwork.kernel.org/project/linux-usb/list/?series=3D124223=
)
>   * Updted the hd3ss3220 binding documentation
>     -> Removed Rob's reviewed by tag, since there is a rework.
>     -> Incorporated Sergie and Shimoda-San's review comment.
>      (https://patchwork.kernel.org/patch/10944629/)
>   * Rebased hd3ss3220 driver based on the new API
>     --> Removed Heikki's review comment, since there is a rework
>     (https://patchwork.kernel.org/patch/10942499/)
>   * Incorporated shimoda-san's review comments for renesas usb3 binding
>     (https://patchwork.kernel.org/patch/10944631/)
>   * Incorporated shimoda-san's review comments for renesas usb3 driver
>     (https://patchwork.kernel.org/patch/10944643/)
> V5-->V6
>   * Updated bindings patch by using usb-role-switch property
>   * Used graph api's to get role switch supported by the usb-c-connector
> V4-->V5
>   * Incorporated Heikki's review comment.
>     (https://patchwork.kernel.org/patch/10902531/)
>   * Patch 1 is a dependency patch to make the compilation successful.
>     (https://patchwork.kernel.org/patch/10909971/)
>   * Patch 2 is also dependency patch to make the compilation successful.
>     Rebased on top of Patch1 and fixed Heikki's review comments
>     (https://patchwork.kernel.org/patch/10882555/)
>   * Incorporated Shimoda-San's review comment.
>     (https://patchwork.kernel.org/patch/10902535/)
> V3-->V4
>   * Incorporated Chunfeng Yun's review comment
>     (https://patchwork.kernel.org/project/linux-usb/list/?submitter=3D133=
171)
>   * Used fwnode API's to get roleswitch handle
>=20
> V2-->V3
>   * Used the new API to usb_role_switch by node to find the remote
> endpoint
>     (https://patchwork.kernel.org/patch/10882555/)
>   * Added renesas,usb-role-switch property
>   * Incorporated shimoda-san's review comment
>     (https://patchwork.kernel.org/patch/10852507/)
>=20
> V1-->V2
>   * Use USB role class instead of extcon to receive connect and disconnec=
t
>     events and also for the dual role switch.
>   * Dropped patch 6
>   * Squashed patch 8 and patch 9
>   * https://patchwork.kernel.org/cover/10840641/
>=20
>=20
> Biju Das (3):
>   dt-bindings: usb: hd3ss3220 device tree binding document
>   usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
>   dt-bindings: usb: renesas_usb3: Document usb role switch support
>=20
>  .../devicetree/bindings/usb/renesas,usb3-peri.txt  |  23 ++
>  .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  38 +++
>  drivers/usb/typec/Kconfig                          |  10 +
>  drivers/usb/typec/Makefile                         |   1 +
>  drivers/usb/typec/hd3ss3220.c                      | 259 +++++++++++++++=
++++++
>  5 files changed, 331 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
>  create mode 100644 drivers/usb/typec/hd3ss3220.c
>=20
> --
> 2.7.4

