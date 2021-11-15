Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE17450812
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 16:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbhKOPUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 10:20:09 -0500
Received: from mail-tycjpn01on2120.outbound.protection.outlook.com ([40.107.114.120]:57412
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234996AbhKOPUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 10:20:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/1RmtDZREGCzsG8wHiDH1yHGIGeTn+gBL5llX0jAIm5BnPqoKqWIsE9B0fGDOgEDjaZ3khXcLhjsdgJHw1fq8ERrhHTyglNEheogKfdBTPzm0QbtQgNSFBAAYszG8sXWSEQzF/3yIpfYuacxeQxYRzkLeyK1w1OZmwcI7Qn8Uw0nLRhrbEAfy4V3qdrTm00kP1sngNNyop1igi9md/G9F0iqnc1fr2TY8Ro5omIkC/8vsZsH5CXhyq+mcw7hKe6pAxd3KuuP7qrwE1aciv+vB1El+ma8rY08jFuKQfn9Gl20NvQipcg/MpkhyVaL6Xw6fhE0ePZOkqLFwjunWu0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBf72QB/1f9qaKi5cwGweWWkDk1/MLcRA/dRYgw73TY=;
 b=T4Nuji5afGwFVTqQXpN7nSNaUN1D8fl36e5ZhS3Use8QHCjjkRmuHN1HFi5q/PHoks1lar/Q0JW+M3YeRh3QiwZqLhFr27kouu/+A7gOzbBk4pR2Q4IfZmOfkhgDse5METeapB+LBdDwuNmCI8Ts/z/wbWktcTGBhcjDJ/OlcVUckh0MhQ1wD93k2JYhjENq40x0j8dQSPvT8OH/WHZzIxcxPQczjfWHb919wOux7GaNyQ0p6IR5iWcKtobCQiE+zzUEET1eg/jmRnoAI5PnNfxtfzxjUlxmYlT17cb2D+kIXLC0RIbdHDtJ1Oi/GOkbrkdiEg+zA7zmM7Fz9QEbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBf72QB/1f9qaKi5cwGweWWkDk1/MLcRA/dRYgw73TY=;
 b=XC+/6UaeH4X5O9LFefKC8S+dswd+5xx+88FZd3ZwvQelBcZNtFuKDgRVJF7Gplfjim7cdpgcI1iQbQi/HFxiQx9l0B2cl549+3jtwG+eun7dw6/MGPTy5PGhdkr30ZWOCfxd5y74msaZOBEqPrxOmSgiiuqRz8EByikh9nnmkTo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3573.jpnprd01.prod.outlook.com (2603:1096:604:40::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Mon, 15 Nov
 2021 15:17:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 15:17:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Julien Massot <julien.massot@iot.bzh>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Thread-Topic: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Thread-Index: AQHX2ifxeC/e9Bm+2E2JGBX7Ft2snawEoDGAgAAJMoCAAAS20A==
Date:   Mon, 15 Nov 2021 15:17:04 +0000
Message-ID: <OS0PR01MB5922693BB948B4E567CEF63E86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-4-julien.massot@iot.bzh>
 <OS0PR01MB5922D67AEFD75847CE5B0DD586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ebca7899-1b7e-66d4-f022-576b18b9bc95@iot.bzh>
In-Reply-To: <ebca7899-1b7e-66d4-f022-576b18b9bc95@iot.bzh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 302a1719-ddc2-4812-fdbf-08d9a84afb3d
x-ms-traffictypediagnostic: OSBPR01MB3573:
x-microsoft-antispam-prvs: <OSBPR01MB3573F3BD38CD54134D8DC36786989@OSBPR01MB3573.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 40nV2FzbpZPgenxEsDdkDKJWtDedbsmkUgqDaQEm7JniHf/BZZi3shRR11DvjbleyCxBBKXAxctPRzAhi9seQ0zV46/ZKuVLLbXt84tFGe1W8cvdJmQJ4lwxRM0GgMhQvY12n9GRtsrXvBJ9oE8lYeD7eO9Nioml4hyOIYL3H9UF5mpuiRh2M+JrFw+Znd64bCx53TvUFq0qW8Pwu40glcJiebWPmXxEZt3sDuRv2c3xUIR0GIeYePTtFxc7h3C9OEBijMq4wF61jlQF/qf98V/unMXk/GKUMa3IJh9d+5fY79ar9iTfjYhA4ilW1esYDt8OG5jOIUc3RngrZ3vcYLl5KHIGYmnI4OC1aFdyYMn5r3nc67KWmzjG0BN5hILDSt3xIJytHs3cdS1ZFETFY9s6L6W29kmXTWy3WPsNCw6XQpyADkauHsix53jAcW4A8QsR9Xpruisx0naeVTewLC6+blqF6zERZctZAhx0Xrk5tUKKXvll6ov65vvvVLIPXlChDEnvpi7qbSQ4VZPe+ey+iwoJImPHUNVWXkDiW/hzflCUoHC+jZaZe4CK/GCaM9B5HpPXg7mNmwsDy05ndK2k7NkJKRugjr67BfPTezk0PzEmVpud0JdWuJjAGUdmUdSYBrEn9p9JlFJ8plvuLY3dNctNykSS829sDcoFMMkh2A0iTDv4IHZTxpSBmghqHg+krGBZhAxSqfwlClololx2n9jUQHIJDF3zBIuwanlhX/oAxjxphjXnAAxwPpFylgwTABHhWgvAT2i6JLRKmg0zDGgtUkidHmCQqSu4Mx0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(38100700002)(71200400001)(2906002)(110136005)(966005)(8676002)(86362001)(38070700005)(122000001)(6506007)(316002)(52536014)(54906003)(8936002)(26005)(45080400002)(5660300002)(33656002)(186003)(83380400001)(508600001)(9686003)(66446008)(7696005)(76116006)(64756008)(66476007)(66946007)(66556008)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dss3X1zzVBUcyFTfX2nn7rQHiudtP7smNxuPkyshFTbISQOsuPA+QnhC3cPE?=
 =?us-ascii?Q?YPxOX1bxKMV+LEYkJowKuMhlIJpV269OEXvBiZDYBqECzpgSwVEa0jT2Jn37?=
 =?us-ascii?Q?tcJiAWFIAOc5tOMkYNDWLPi8tbFkGL6BUe57Tk52B9XmjevAxpDBGmZxNBzu?=
 =?us-ascii?Q?yolkdFs9Zt+IL5dwAtUHplMmpQAbjlImbyxVtfCgs/WeLgnYCFmkryPBAXQi?=
 =?us-ascii?Q?cKFD9BM1w8YHRJPXeYAnXj8UEDDBsx2v12Xt+UpcqCWqm9g8BrFb0OgAC11b?=
 =?us-ascii?Q?e6zgbeZA85cOZEvyvP/x8vDF9WiyxqQUOdW6jJz1VrLIRSn65PggqcwInqs9?=
 =?us-ascii?Q?EeFM56+V25enyDdhrYWvORh9VX5GrvuQWCeM3gJIXHUWFKEFSz/oFIl0/Loz?=
 =?us-ascii?Q?BUMGxeYKlfslQYtIE/Ls60eJzhCjr1LORpbr2M/cErww0nYu/9XcpcuBCYA2?=
 =?us-ascii?Q?ukEKFyNX1Bv5+C6VeSA7Nytp5fJJxC7RfuJbyGnMsM8ctHNFlppw0UnKDAgv?=
 =?us-ascii?Q?YZnE3Zlp6/ovgS3BdpVBCeST1Jg1MUZmQ4VPG2k+bEavt3i4Z9v5OR5WxbhO?=
 =?us-ascii?Q?dz+9NUHbmWneeEh++leMY786eVX1YdJmau/fTSnVLaKManrr2KQaUduOjwmr?=
 =?us-ascii?Q?rZoNr8rR3cQ5AOkLKxzw7qSUp0/iJHD3BpMOWW/tDk1gjY0IV2kCYn93Bzo3?=
 =?us-ascii?Q?2GH2h6o6X89duy1r9zg373wx0bFVwW157tibB6boh0Ht+Kc50+dsvsitMrRV?=
 =?us-ascii?Q?vO5a93qoiyOUKSff23uK9qssdHW+gXPedmDwnY9l68dvrksu6a1CqZhcDw0W?=
 =?us-ascii?Q?dhTJkGayuW6TTqp+hrPD2Vf7uj+TqPtrQlXq5Fr9+KMjjhlX6KLKRwMV5ERx?=
 =?us-ascii?Q?QvcvqiHTD7Vw2ojRqKL9gBhYwyWnNkF/PFAW5L0Z0qUKaloFvXrGcmbdh4f8?=
 =?us-ascii?Q?ubo0OTnylrgdWQQsIDJEil4qiIZyKCNnL5iujuGTx6GKezyyBSgCXHriMlZT?=
 =?us-ascii?Q?vqbbYC5UsSMWjmaz20pnpE0tJ3Zn8Cr0MQc+CnQh3pcHur1cMpkGQ2cNjFaj?=
 =?us-ascii?Q?NkgoN7wJ9Le+rTjpnr9gIeJt0WUJlfK/KeaErB3ygB140ln/NM8khwPefQRj?=
 =?us-ascii?Q?2WS5Nf0deyCBi9HVmVBZMsenkzDjhX5ayjnx171IidP2gwvsJ2zDSiOBd0kL?=
 =?us-ascii?Q?OJ/L59PkjTCYGcYRIJ2+IJzsjRpB+Gr+c46DwB14//KBc59QIxRVVVgTJ04l?=
 =?us-ascii?Q?uHDyfN0Zp+cr35bfilEJLSbAbRwevFo29ZYQRZ6tA4Gq5TIWl7uaN+mOyF1k?=
 =?us-ascii?Q?8nwQPHwliDD9tHxg24/dCzjYdx21xFYrO7RyRlHUuQkRu4O+doWpa3riNULK?=
 =?us-ascii?Q?Yfzh+gaCWNgDEfAUCM8aUWjcM4XDnqZnFJMF5cIPS/qEa56N8P/2vuN8UtlD?=
 =?us-ascii?Q?Rbq3d2chD3DVb1/P1xANmgFDotpGydIPYqTGfRDYe9lETDfGACn7AaN4/HFV?=
 =?us-ascii?Q?pcaUybhFfHVFIXjHfziQPWEKo9G4kEif329twsiKqgUe7/91hTCNLMdS6n70?=
 =?us-ascii?Q?AdmpaaE1Wq8Ft4IiacC8+1eOG5+IRS3xt0WE10vIUjkNZc+bIGBiSfkq7fLr?=
 =?us-ascii?Q?sYrPOPehwl2TVwYRvVuY/RBOqzBdBZ9CkLVjfrKSKFOS/3d567j8kBplygiu?=
 =?us-ascii?Q?YN7mpA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302a1719-ddc2-4812-fdbf-08d9a84afb3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 15:17:04.4541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuj97WzLmYuHYohaPvofm5RRTai1p9LfeBsg7UbSuyhxbiqfDM8PRueUkWnGOq1W5g6XMVO8PCuACq7EDV9pkwrDWCE5RhvZHrUx09vEMZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3573
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

> Subject: Re: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
>=20
> Hi Biju,
>=20
> >
> > One question CR7 Can be master boot processor. In that case How to
> > avoid loading and booting  CR7 processor from Linux?
> > Reading boot modes??
> >
> Thanks for the question.
>=20
> I did not test this case.=20

OK.

There is also other scenarios where the
> Cortex-R7 is started by an earlier component such as BL2, u-boot or OP-
> Tee.
> In these cases Linux should not try to start / stop this remote processor=
.


OK. But Linux can check whether CR7 is alive at frequent interval and issue
Soft-reboot, if there is a  hang.

> One idea could be to read the power status CR7PSTR / PWRSR7, or use one o=
f
> the MFIS register as a communication register.

I know MFIS is used for communication between CR7 and CA-57. But don't know
much details.

STM32 processor use this
> last solution to indicate that the remote processor is already started, i=
n
> that scenario remoteproc driver starts in 'detached' state instead of
> 'offline' state.
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ern
> el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ftree%2=
F
> include%2Flinux%2Fremoteproc.h%23n418&amp;data=3D04%7C01%7Cbiju.das.jz%40=
bp.
> renesas.com%7C945a25980e5a49cc361a08d9a846020c%7C53d82571da1947e49cb4625a=
1
> 66a4a2a%7C0%7C0%7C637725840924834250%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
L
> jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D=
yXH
> 2qBpmUI2YtZRnApFdWt6iONcFKDPSPa45AirThBw%3D&amp;reserved=3D0
>=20
> In that state, remoteproc driver can initiate communication with this
> remote processor but will not try to start or to stop it.
>=20
> That's something I have in mind, with an existing implementation there
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> om%2Fiotbzh%2Flinux%2Fblob%2Fiot%2Fjulien%2Frproc%2Fdrivers%2Fremoteproc%=
2
> Frcar_rproc.c%23L524&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C=
945
> a25980e5a49cc361a08d9a846020c%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%=
7
> C637725840924834250%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2
> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DWYKygEUiXyliOmX2C=
Uxk
> Yfj5pq2QOmZC%2BGtXRAlB%2Bws%3D&amp;reserved=3D0
> (that is not ready for upstream yet :)).
>=20
> I guess this issue also exists when one device is dedicated to the secure
> world, so the device exists, but not available for Linux.=20

May be for prototyping activity, if some one wants to run an RTOS on CR7.
This will be a good solution. Linux will load and boot CR7 which
Run an RTOS which communicates with Linux. Once communication established
Linux can check the health of CR7 at frequent intervals and take necessary =
action.

Regards,
Biju


The most obvious
> (and dirty ?) solution is to keep the device disabled in dts.
>=20
> Regards,
> Julien

