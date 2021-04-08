Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC92E35905A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 01:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhDHXe1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Apr 2021 19:34:27 -0400
Received: from mail-eopbgr1320104.outbound.protection.outlook.com ([40.107.132.104]:30361
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232426AbhDHXe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 19:34:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/v5yf/oFfFVCHLc2LIdtYUkR5Iev17ajPjGNGomNCdmC0vG0AH77AO2dSfPrzDgGpC5MeWdvuc/hHDz+jSKk+lfArtYMu7QXPb2spmisKt7O1KQdqxZW8rquCjf0zUkgu8W2m7myH4buo5w4Z3a7p6nxDzxcFjt1F1k/g8FXKu8xafI3wmh5Q1+MY9emsGXSz8NNr94Pje8AMWM4aGOeBfHMA6tRg0g0B/PDIz4j5B3z4+HXTFTZKPQ3PI5Yu5vfOfk0gs9WwETyk3khdMbbJDdnW2Hh6qzkpXwu+15uwi1za+xeAc3GE2zptUunQ3BdPcfUU5qCgJKX6nRUxNoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DSY0X4eTnl/zw1+5DJkcsGjFKf6/cNS83fmLvdLoIE=;
 b=Kq8Oq8QSmo+qVIu4EZ1v/nZF8kkwdX3dj4+UJnjXwzkGZsZfXq6+9PqGBfMXXHWGlzYIhGIOUZGptN2GtpKTXwtfiy87LF9II0pf8ex7kHZYtQsLh+0GN+pZ1vw5XBLrwZOIY9T/+Gs+poJEBsX+gbriwA38oZOk47eljYAY5GZfUoSD+9jBFayINMX7H1StLgKpOBLB5ReaL0GZ9pBqSpBTpvyGNTJq3Kd96Pyf1Q5Tww1eB3AnHQtR0gLS7osTs7P/UUL2ccTxxnwtS6S/PY2MlXSApyQlHKxEqXdVeeMgwyYyj0P+mifSj4GMZ6yCfTDA3e4z8STRHVSDQTOPBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DSY0X4eTnl/zw1+5DJkcsGjFKf6/cNS83fmLvdLoIE=;
 b=oO2+OEJZ9hK9+qW6FXMfgJUo9vu025r+SdRZ6vFnKlA2WIbHf/pVF0niJ1SiCTd50YZsY1sArrAOj0nsYt0O9gEAIPGd05nJJ06QlBsuX8DcQdTKNwoK2EoZ2fuWLijCq7G1CA4PCDgcH2Xdo1ODM6r4FTub4Cl1vRw9UmnNCOc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2635.jpnprd01.prod.outlook.com (2603:1096:404:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 23:34:10 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 23:34:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document r8a77961
 support
Thread-Topic: [PATCH v2 1/2] dt-bindings: net: can: rcar_can: Document
 r8a77961 support
Thread-Index: AQHXFyUnmo8C293ABk2QSDh7+Nhfsaqq1qUAgACaJPA=
Date:   Thu, 8 Apr 2021 23:34:10 +0000
Message-ID: <TY2PR01MB3692EE98D159C2B216265422D8749@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210312095030.534957-1-yoshihiro.shimoda.uh@renesas.com>
 <20210312095030.534957-2-yoshihiro.shimoda.uh@renesas.com>
 <20210408142130.GB1034@ninjato>
In-Reply-To: <20210408142130.GB1034@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a924a8c-715c-438b-adcc-08d8fae6cfbe
x-ms-traffictypediagnostic: TY2PR01MB2635:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB2635485DEF3FF367B499D3D8D8749@TY2PR01MB2635.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YbGFHSCMOAUbHjDV1DFBBtdY1gWDOPowNO4Ubl/zY7BtNLCsdmqYZidwA8S1ykOk7uKWGU0urUrehpWIw7qVPzVCbuK7wBjGsIw5/4dde+CFi923vtNWuSWQDyTgTUbRVuNh7+hZhq/i1caVXXpd+v4Za7qVI5d1iEXMk8Z7GEixeQ8K0dfV26w3FG10opDBR2xdBrtd5QxsmP5ArACJW/RelXtSkUwuZO39NLWRkGHvMBhScqXiGoAWtk955JYLHluoKkpLI4FQ4/h1oPwyLRoyul8YWDDUteH//UwhRMh/vlFMN6L4O0OYfG4CfQ7ZoylJZ/5dP6kiM6H9o3MTFQytG6j68Ta1EBi+1zAa5VJTjwT+HuMwaEvm+fG1U2PCizIYmd+GVUG53zn/tjbcIgFk78vU5RzhgbJrJJ6YvuHow99qqbF8+9k66/mj92PCWwhzSvjAA8qTBaXejdwIfRFiQEbf/kuED+awwn3t/+brTlCdSlrZ14yIWO3uCZG0/7OAWeskEa1Tv2tsLVWwWqcFdI0FGc3atQojE/SdQsLhlHedvxY3o/MYgiTlXltR2JXQRD6A4x1l4d8HyhpycILTIX1Oe5z6zgSoo1cuxHU2H9/ATZaOcRIPn8cfODiiHY2qyeSZj6U2KTbMRfiWVzF9yB/JX10s/dPsKclZFiU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(8936002)(33656002)(9686003)(55236004)(6506007)(2906002)(38100700001)(6916009)(66556008)(86362001)(8676002)(7696005)(71200400001)(54906003)(26005)(83380400001)(316002)(186003)(478600001)(4326008)(55016002)(4744005)(52536014)(5660300002)(64756008)(66476007)(66946007)(76116006)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JiW4a7nyDIWbKHoE+gSbHD0vxASBKUeIHunAf8SUGsdk3FGVC6BL2hpyTHkz?=
 =?us-ascii?Q?k8OEEpc/q5bkXLJ7vs8zXe0LsELIR7JEaRA3AFba1V/bBEjbCg/WSVns2SUg?=
 =?us-ascii?Q?iA6QIeyhBSYKV1wucyx9b46+YcTE+clhhv5XXc5M+UybGrYPZphUDau9Hz2s?=
 =?us-ascii?Q?hx4YY/JC0aC+e0i41/e2ssczHFqliH1QuBaqScmNTQk18XJFmiRarV5U3FtK?=
 =?us-ascii?Q?SzWyePqFhCoUWVNNx8PLIoBAUououAhMy32AA/yDymCWYkMrLvLlUUL7rnPd?=
 =?us-ascii?Q?8uWtjasfd9IHIYZ4brWxk+9ur1rEUZx4sZ8MRS2jeEo2/aoYltPqIObb04k0?=
 =?us-ascii?Q?N00SIGWvcd++76rYTeFl/90phuWkPd0QeukatEmyyoIADN/QHWoDutGQOl+Y?=
 =?us-ascii?Q?j7AZQ2yRCYCgdOsTlu5EC5fHH/QmPaIjqdF/J6beB1HMMH6LHnbbY0vXprWp?=
 =?us-ascii?Q?cyyvVPJ/ZcfQm4o5SVJZepuRUZEb+yyqjH9ACZYC+fD6h6hVZmwHkb3DUj5p?=
 =?us-ascii?Q?AdDssjqrPU3vbiuuTQLTOJ8Ljv98sORUlT8QkaXLXc9qnEYV4uW8TSh2mWab?=
 =?us-ascii?Q?FHLyWWsOUuIFCAgh4UWmhX1lo9JKT4e7zcvkiLnXb4NJeGUDqdfaW3b3MWeo?=
 =?us-ascii?Q?oYjI4SqZZLFynhPQNCOMhmycq36nbdVenBN6RHg2oK7EO0lRCjFkcZEbwW9s?=
 =?us-ascii?Q?pY+l5BfNLv14m+HSqz8/uKhC/LMWlLpudTl6mkuPe4UjX8RXRYoOo/twcQiy?=
 =?us-ascii?Q?h0IY1Q0XMQGL00kghDaM7vXQfsU1kIaoZLgDlNOHzveTvm3MkWx5eJ3xFtDE?=
 =?us-ascii?Q?MeFOFKQx8HlmHBsH14er46K43vS2SIflwJZ8dUdxE/o2i5LVEMsQq4sIy0V+?=
 =?us-ascii?Q?7kX3zQe2vSPnwc3sdQYGhZvf9jTWZowKhy9kN5dmPn2iDtDsf4HQbAunrsP/?=
 =?us-ascii?Q?wq+vOw1owhrGdNBzFnFm1KD55P0mAooLgNRggSNIPqTdDXeEjR7kAR/0cNwE?=
 =?us-ascii?Q?FViVBSR51/zFKWZa5+iyhPMxcc1IY7V6iMxt8f2GHBjy+Nw7tn3/QJu+ODWM?=
 =?us-ascii?Q?cbzbjwfKMQuXhlK6OC4+f7pVVYcfat9A0ggQAoxePesm4eiLUNMfznCUFQj9?=
 =?us-ascii?Q?A5JLkVeAtVGriOyEPS9/2yU0++VmzeFS+dkb0m8+iLHs0IaQMkHHuzHf44wk?=
 =?us-ascii?Q?GcCnndY41KzCMdW9obqcqb3tgxAXmgE+lceCgBKlD/zUSw6Fxs3+/m4yV2qf?=
 =?us-ascii?Q?OttgM6p8a+CZIFL5/EuBNUgjF6Iw2jXCEUi8wuk51WhKmgumwDWyHurtB741?=
 =?us-ascii?Q?Fxw+nKPvA4zEW4fbnXtCzMxV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a924a8c-715c-438b-adcc-08d8fae6cfbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 23:34:10.6128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7I/i6UKdSh7PGoLBhM+pafpupu6P6iF/4kFMHkw6fMwSLhZs8jrKSbqxeawd5lwevbFTMSnKqGVPej+y7vdRdrWD2UNuUSelhfobMPlivZ5O6D9GpHc0ZGzhWMNExWJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2635
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, April 8, 2021 11:22 PM
>=20
> On Fri, Mar 12, 2021 at 06:50:29PM +0900, Yoshihiro Shimoda wrote:
> > Document SoC specific bindings for R-Car M3-W+ (r8a77961) SoC.
> >
> > Also as R8A7796 is now called R8A77960 so that update those
> > references.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> Shimoda-san, I think you should resend this and add netdev and
> linux-can@vger.kernel.org to Cc. I'd think the CAN maintainers will pick
> this up.

Thank you very much for your comment! I'll resend this patch
with adding netdev and linux-can ML.

Best regards,
Yoshihiro Shimoda

