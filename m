Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6BBD32D4D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 15:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238208AbhCDOFH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 09:05:07 -0500
Received: from mail-eopbgr1410092.outbound.protection.outlook.com ([40.107.141.92]:32564
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238818AbhCDOEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 09:04:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4ZI1b6y2bV0sRbtqiog5j6pj7E7PIehoRW1Nj2QP+/2PVRMwhkr+4E57AV5mPl9sceEUVP9tCIlJAq6YRco9ZYEop+uZ2luzbTq6or9mHshgYrPm/mfBHMMZh8rJHyI9sO60Xr1gGWfJvt4aGGRRGez1kKySaryuMt5H49iFHm0dibUY4rhx9hb0RZ4BJxHU6P33S4o3KsUvRUbPVAwTtCtzuV9v9jV7CV5/l7KLUamRoC/0eIObp2jHBOrb9XzM+guVZKwZ3/SgQQgT4YUrVLraT8epXFTq/gaBkfXa0bffPe2clxvyKcRuRRWpBC8WOVAc9aEE05BWDuOaaQgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYXEXyjJmhwDMnXtF9nJLbsI8nODiYecKsqiTlpWzRA=;
 b=Gxo595XoXEasY0FtV3hBmaK/kfGlZM3lMfr6rjgO4M8awbZxvptu+PA26RjbPZM6TZ3epy4BFA93oRvIr49zMweNKtMclBylUCh+BDMbhqKRYCwItdKV2Bt73v94eYiNpxsKVdmgd4X2Jyn3okFSxOn3IvEYs6rHljjgnhxiKkfmOhdpY3NqoHsl9JEXUhyLv22brWKu0aaIjas6/aV+q9NQZlrnsUMppVMvq88Ci9wzSIiknviZcpjDBmdgDMmMorq/hHVgs8pcOoBX2dl2Fxrs6qx7N7Cbbue0WvSEns87pDFWwBh3nCZRn/Mw4EQDg3MAMOCAZZQmlzAyEyDN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYXEXyjJmhwDMnXtF9nJLbsI8nODiYecKsqiTlpWzRA=;
 b=kBeDA9vs1VqmpEz6XbrCkiWo3EsD3B2GQJzkYA66FmCL3sYffClFSz1ZX9tOTKvCjmtfGkUMUuDRFXcBUWF2xg+0k4LthDn6Rh/yL+GgtFAv0h8XJP/on2bd2eOMZB788s55/I5r6xLTYWJ5z0szq2euV/g7fsMYDc7NzwM4B90=
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com (2603:1096:603:1b::19)
 by OSBPR01MB2693.jpnprd01.prod.outlook.com (2603:1096:604:20::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Thu, 4 Mar
 2021 14:04:07 +0000
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::b103:2ad8:9aae:6aae]) by OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::b103:2ad8:9aae:6aae%4]) with mapi id 15.20.3890.028; Thu, 4 Mar 2021
 14:04:07 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
Thread-Topic: [PATCH v2] ARM: dts: rza2mevb: Upstream Linux requires SDRAM
Thread-Index: AQHXENvDuzevs/nQsUKhHA12RiMnXapz2wHg
Date:   Thu, 4 Mar 2021 14:04:07 +0000
Message-ID: <OSAPR01MB2114E13D694F416A8A6E33378A979@OSAPR01MB2114.jpnprd01.prod.outlook.com>
References: <20210304094945.4003097-1-geert+renesas@glider.be>
In-Reply-To: <20210304094945.4003097-1-geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctNzljOTJiMzktN2NmMi0xMWViLWFhN2MtOWNlYmU4Y2NjNTQ4XGFtZS10ZXN0XDc5YzkyYjNiLTdjZjItMTFlYi1hYTdjLTljZWJlOGNjYzU0OGJvZHkudHh0IiBzej0iMTM4MSIgdD0iMTMyNTkzNDAyNDQyNjA5NjU3IiBoPSJtREJFT25VZnVLOHZtNkdSQWN2SEg4Z3dNQ0U9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4acf328f-e968-4225-d852-08d8df16609e
x-ms-traffictypediagnostic: OSBPR01MB2693:
x-microsoft-antispam-prvs: <OSBPR01MB2693E8490B851C3C5A7468888A979@OSBPR01MB2693.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S1Wuz/J2P/Hnu04sffEzBXxGFyVIJ3bIOaju5cT7To16/zMKfPBYwro0SRyMCZxZMRDzXfYcCPGiIjUzAQox039mA4TGcT/kFguVjgcnoTwA1F7p3B3jBT3Pp6N82J9a+HLyVzrMFk9YWDMM+TSt6nfuWlCnynmGVqDM+yT3AX7ieHhzjyzl/uvOml6g+7AODitbCkvRzh/5zc3QkR+T4c4tMvcqZt5q6NJZCgQax3wrD90a6Z56awAqFYqMPmrS8yGEzHRK7ThktOW+BM+pEeNmzMOJVn5hcYwM0mKDpxSL3+rKoSpcoRq5R+DKzupE91BnsjEU+uSS4/CGvYxdOrusU+4w+h+PLRzCNY4cNge9j3yND86wzV4DH1bpOxdyOE3xbMXeP3QRV4JDaCiR66nBCVZRy+CJvhZIRwr894ams41ZcEwioD90SLy47XhdAoDO90FDy3S93RXt6n0HJYVv7CKt8GETQYcGcgsoan6tqa2f40bJkEYRrGM2xNQbc8/MWQ3V0BoZceFZO6ApCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2114.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(33656002)(86362001)(2906002)(66946007)(110136005)(55016002)(54906003)(478600001)(5660300002)(316002)(8936002)(52536014)(71200400001)(186003)(64756008)(66446008)(66556008)(9686003)(26005)(4326008)(66476007)(8676002)(7696005)(83380400001)(6506007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VqIEhK9qApOflK6dwuFGhnukw1cDWtnE7Uwdl1QD9zN87EIW/OFs7Ipl9ufI?=
 =?us-ascii?Q?ZEbBQcIXGoaoWDyOMpmlI2zhN2xhq8vUMve5GgU4wxZe4AlPB4O2uSBCIeIt?=
 =?us-ascii?Q?7nXxw7LVQ9BcSSn6tFUcaYV9UiuLipxkS6jXJQ3k5LmPz01HWSzt8QIII7qq?=
 =?us-ascii?Q?P7aN8DRwrDVGfn9qtnzCFs8OzdUTxf70TE014+4XZ4AAMopKchrmPbzzBUeh?=
 =?us-ascii?Q?iKD+PnrsbAvdDQCRX0luN8sQhM6i7z5thQy4v/aDgjuaxT2lO7zDLSlvw4LQ?=
 =?us-ascii?Q?XCfsRI+JzxSV9Wt0zYQKCGy4zO1CTFBhnFpo38TZBcbSyZzYRUNdzpCQG91n?=
 =?us-ascii?Q?/tdp6crW4vM2Lc7GskGr+/dg9iajRI1LRfg0+X9DVpXZYtpV+ZLit2LNFBws?=
 =?us-ascii?Q?J0DWE+DIdj20OIQ1t+oAhSkz5r+9FeN+mEg5aHTjbBp8NkAMr5duUjt+wUAb?=
 =?us-ascii?Q?y4gfyd49QdtXmzlMe0R+JqU7L7c7wbzsVFzPibmrInS656seRQ46+83OBsi0?=
 =?us-ascii?Q?sQ65I9luK7uiuO7WynYxixvcc35cDFyy+gorcNWM1knB4W0GwwPxdZ8Ss9YY?=
 =?us-ascii?Q?W4s9qaMQ++EnzQoZY8Ub5hnismPJYcFeok0wEaopDDFejWmrj5bYiljYxvMt?=
 =?us-ascii?Q?bvwdg/eAFhEnnfHWhFo3ULF+oYg1TdV8+dVEPhnRzWZkdkKTsykaBWrXblfJ?=
 =?us-ascii?Q?zoHhqWu6GJ9aRT9oE8vygJvPRJq9Sg9EoOLK06M6YtrB5KOAnS2yXjP4vniC?=
 =?us-ascii?Q?1iFVyy1lQufcXDXWGiPhnNZ4yiGRvUy6r/xE0QWkAQHz3Py/okII0HMCXfIw?=
 =?us-ascii?Q?+6tan3zAljXDVMVJEF1aH4tHvpxgHsOHmeh6drBhgH0PbuVoXBhBvlqO1hrs?=
 =?us-ascii?Q?wwM5dSrBh1BOtQrSZBmhhrgmQbMW/j9W6YLMVYJxnz+/xlTt838g9VczczkS?=
 =?us-ascii?Q?ynxEC1Gbti9CJyhjvl43rZfxjAYc1HD+vxkZv4pApEqXBD39Y8pAvCkLuPrS?=
 =?us-ascii?Q?EvEMHyaWjsi8F5nRIqEYMuLinSnqFbY8GhLiHeEW/QsrQSAbMGhwbT1B1j/N?=
 =?us-ascii?Q?p7ck+jGa5xYbGVMkKJe73exItcoGPfnjlPch8APVb6/vl6T1oW90S6o4N9//?=
 =?us-ascii?Q?LH77JCLEFqlt+atbXIS9boYopkGbTv5IvvMQ/lCEqdFcHuASdxFVXh2JJWN4?=
 =?us-ascii?Q?8bYP2Js6+FK6EoUNQQQkHQI3y74lotgbC7jmUgxocCIDZ2LNLvm3M22+522M?=
 =?us-ascii?Q?kngqGIzjmeFGhBmYmxaBqnd0aNCYDou39Dsnwh0R+h7Vi0jm8Ds4A+M1lldc?=
 =?us-ascii?Q?MwDp+gMsyvEIo64aRvjNPFXA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2114.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acf328f-e968-4225-d852-08d8df16609e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 14:04:07.5323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZD7thU4/PchoAPIFbIptgZUhIO9hRKOiE0KwhGgflFfej+UjtwbKO9T8m7jtG8TcC8EwhaWnOXK8W9hZFQ0CgJMPYWcnwA5WrBPqbP5wxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2693
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Mar 4, 2021, Geert Uytterhoeven wrote:
> As upstream Linux does not support XIP (eXecute-In-Place) for ARMv7-A
> platforms that are part of the ARCH_MULTIPLATFORM framework, it cannot
> run in the 8 MiB of HyperRAM present on the RZ/A2M CPU board.  Hence the
> 64 MiB of SDRAM on the sub-board needs to be enabled, which has the
> following ramifications:
>   - SCIF4 connected to the on-board USB-serial can no longer be used as
>     the serial console,
>   - Instead, SCIF2 is used as the serial console, by connecting a 3.3V
>     TTL USB-to-Serial adapter to the CMOS camera connector,
>   - The first Ethernet channel can no longer be used,
>   - USB Channel 1 loses the overcurrent input signal.
>=20
> Based on the Linux-4.19 BSP for RZ/A2.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I'm happy to queue this in renesas-devel for v5.13, now commit
> 0673cb3895121506 ("ARM: 9045/1: uncompress: Validate start of physical
> memory against passed DTB") has entered v5.12-rc1, after 2 years of
> development.

Acked-by: Chris Brandt <chris.brandt@renesas.com>


Nice job on reading physical memory start from DT instead of=20
hardcoded/guessing in kernel startup.
I think that is great!


Cheers
Chris

