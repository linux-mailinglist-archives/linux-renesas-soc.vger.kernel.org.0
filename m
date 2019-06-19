Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5340A4B27F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 08:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730826AbfFSG6U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 02:58:20 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:11834
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725946AbfFSG6U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 02:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cb+aZBeU/C2Y0szaMFW9KKj6lHxZEqXNlG29ElRT7iM=;
 b=JftnLYKRnrNQbHCNjrjVCb/IMX9zsfeh2xZ26P9b4kmviXCt5kPlRbn7hpILTsYG2SMDvC80zftUI+OBBtRGFCEOsRw00w+s1lUwvIkEuSMsm4SAHeluouKnypVTw+xesbYcHnv5HrIsRwsSz56HpBWF3DROGvYOlRs6edsP6Qc=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3414.jpnprd01.prod.outlook.com (20.178.99.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 06:58:17 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 06:58:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: RE: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Thread-Topic: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Thread-Index: AQHVJOvzrr8sipd+1UG4ND2WVDbsV6aijRlw
Date:   Wed, 19 Jun 2019 06:58:17 +0000
Message-ID: <OSBPR01MB35903D8166947D92B0026AEAD8E50@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
 <20190617090603.8449-3-horms+renesas@verge.net.au>
In-Reply-To: <20190617090603.8449-3-horms+renesas@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90c1d0db-2d97-4ff0-615b-08d6f48381ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3414;
x-ms-traffictypediagnostic: OSBPR01MB3414:
x-microsoft-antispam-prvs: <OSBPR01MB34147A66277334DDC9C452F9D8E50@OSBPR01MB3414.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(346002)(366004)(39860400002)(376002)(199004)(189003)(486006)(81156014)(3846002)(9686003)(4326008)(110136005)(229853002)(6116002)(478600001)(26005)(81166006)(316002)(186003)(25786009)(55016002)(54906003)(14454004)(86362001)(66066001)(6246003)(6436002)(76116006)(33656002)(446003)(256004)(5660300002)(66556008)(2906002)(8936002)(66476007)(64756008)(66446008)(4744005)(11346002)(102836004)(76176011)(99286004)(7696005)(476003)(53936002)(305945005)(8676002)(73956011)(6506007)(71200400001)(66946007)(53546011)(71190400001)(74316002)(52536014)(7736002)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3414;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y3Y8keX/Ubc0tc56VNXeD50LXAjKLLA56LN0OKCKOKi6nyTy6Q+knmWHzqmkbvpyOd8ZgHQNj2nFWCJOlhGMOYYQ1IQiIo2NmT2q/Vwu5UbwwyuLJ8XndVeeKhDg6V7NI1gnuP0kGReEAd6lcUZ8BZW2UM0XQ4+JtvZOnjrPSiOwnRxahzbhaJAxo10P9PviQFlINr23/PP0TtIbXHfisDbt45Xrbu2PhKHdtIVCCRktJNTzqtXs4lzty3uKDy/a8GEPpOurs+cwIIIjXOgX/Q4QkCWfwilWuBhMYWRCZ8dyJ4v4gUXSk1WENZ1PorWghKfwXdQGxjo6Sfvra1sENeoVXKUl3xybOPY13rZ3OuFuS19BRjrbQD2pyXCh1ax1E50/7KJBObwPsMwqMt9FjQAWBZJJQPbmuPOU5OsXeEA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c1d0db-2d97-4ff0-615b-08d6f48381ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 06:58:17.3242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3414
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

> From: Simon Horman, Sent: Monday, June 17, 2019 6:06 PM
> Subject: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings docu=
mentation file

s/gen3/usb3/g

> For consistency with the naming of (most) other documentation files for D=
T
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas-gen3.txt to renesas,gen3.txt.

Likewise.

And, if possible, I'd like to rename it to renesas,usb3-peri.txt
because the compatible is "renesas,<soc>-usb3-peri" and "usb3" is unclear
(host or peripheral).
# I don't remember, but I guess the driver side filename is
# drivers/usb/gadget/udc/renesas_usb3.c, I named the binding doc as renesas=
_usb3.txt.

After fixed them,
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

