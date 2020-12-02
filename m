Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8092CBE2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Dec 2020 14:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgLBN0z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Dec 2020 08:26:55 -0500
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:35983
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727050AbgLBN0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 08:26:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaJwH9ljqxbVDP97luvQIKdkXabsPdyUiWfApY3hGW0Xz7kwTUr9/7SI2vkYaNU2CFj5pk3E87e1068sCKmVqAy/U67bCupgWGRZ1LE239Ub6LDUTxTd3FpmrtJtsgHR4dNHnmZPswHaQCNZgezetiDhE3hLP0Hg0q7l+ic2mfImTiz7xB8+GScj/143CpNnp0v9D20ZDCcDWJnDx52nGTunTKtI+FDc1GDIBhLFMhQbrjqyShbfUEhXeoG9KHmYQd1ko6BSr/r6GIPJVAtHiq0kmvvm8MWBox3i3jXIOX21jXLDtlIZGhtwbD3keVpde6pA5RkqcWy66dMAtoPMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swURQtOpnMgNDNyKjR+eIPutN/uCMGHZoRXNWQVu+no=;
 b=OPPNLreX2k2zoveTMLTf6bmC3BkAblt4IDXF1o1Z/yjqI/STIbkoosowSHLfrMqCRYx6OnCSiYSNp5D0V7V47VLD8BCc+6cIvfw04r/Pr/WMzvjmn4wuVpWtpPJeEBn4gT9C041AdGL7RVcI+1HsW+S6lAv+r9AzTAcV7Rs3AWG3AFjMNMRLLpDaXTXdfyfdmz1l9ogMvv0JKMiILIVCn65Gf3M8lwqGX0X4LpiPQ0iwn4IT6FfyFno9uH973/vKq35hPx1cU7RoUonHAeTOrDVFYdIB60+wDEmncQcbn8YVGt/MNSYvdwksjFVi6B+F0bg0dlfJvYD5DpgstCROBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swURQtOpnMgNDNyKjR+eIPutN/uCMGHZoRXNWQVu+no=;
 b=lYssk32spKi+zX+1EITXqU313+M9OLrn0b5sZI43GGzto/1YHCXbkLrg2ffCuTFYmCLDStwpCC6/Gb113rKDGl6E+Y/IG28rh+8n/niQXl0l+P/egtI9sJmur/wfqBg2fI/tluzBro88Acbu1yHTnYW9uJi4U9LF/SG0Wemb5dM=
Received: from OSBPR01MB3686.jpnprd01.prod.outlook.com (2603:1096:604:49::23)
 by OSAPR01MB3827.jpnprd01.prod.outlook.com (2603:1096:604:5b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 13:26:06 +0000
Received: from OSBPR01MB3686.jpnprd01.prod.outlook.com
 ([fe80::7141:f272:e046:cb65]) by OSBPR01MB3686.jpnprd01.prod.outlook.com
 ([fe80::7141:f272:e046:cb65%4]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 13:26:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: tmio: improve bringing HW to a sane state with
 MMC_POWER_OFF
Thread-Topic: [PATCH] mmc: tmio: improve bringing HW to a sane state with
 MMC_POWER_OFF
Thread-Index: AQHWw2yTXOZCIGD6V0O8+hzLhzoTJqnj0bOQ
Date:   Wed, 2 Dec 2020 13:26:05 +0000
Message-ID: <OSBPR01MB36863540D1934A9BBF423D04D8F30@OSBPR01MB3686.jpnprd01.prod.outlook.com>
References: <20201125204953.3344-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201125204953.3344-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1344b986-2a3a-4d9c-269a-08d896c5d2a2
x-ms-traffictypediagnostic: OSAPR01MB3827:
x-microsoft-antispam-prvs: <OSAPR01MB3827AB351FD4530E0FB4C135D8F30@OSAPR01MB3827.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tmcbhhuaAFnJ7d86lS8kk5n+weKSVh95RK+H6srUIgHY1cXzQ6gLdrnSkHXlDvOPu9XI0pa8YpgtFoThjrsah8Cp3yJeWjsJiHzzCWfgvPN75oPa2MMxcFi6A6Vvz3OGBZNbMHHgCQzXvLLFClvD7SGY1IKW4z8wIkd3Qt+Nkm571x/v/9awW37EswtTj8sNxDhPu/JI69xNIs4Xc/MdcBcRIt57s9Sx/wIH2GopaZF3ppWu4OVDpJMc9hbhT4C5nTbB8fZslh7hlNiLXB8bT0Xb8RPiWNImUuWSYMES0Mu9JZRwFiaAmnpBDEoTJPa+qiUhdMHONTJlcQvx5k2Pkg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3686.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(7696005)(76116006)(83380400001)(2906002)(71200400001)(8936002)(110136005)(86362001)(5660300002)(4744005)(66476007)(33656002)(66946007)(66446008)(186003)(52536014)(9686003)(316002)(8676002)(66556008)(64756008)(55016002)(26005)(55236004)(4326008)(6506007)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?T9IHV5uSskDC5bX2ff3scIeNb+W+Nl6+9YIErbDykxFjt7wDLt+Cb4PhoOVF?=
 =?us-ascii?Q?iB0aFKv37nr+yeKOg+6TD1WsVc29Y4otXq0izdc5sUQjDHHyQPW5F663GHuj?=
 =?us-ascii?Q?C85xks3TJP9Mf9B1Kw61/Uu1cQw43K//Lq3NrFMSl+LreHgvy1QXu7oTrAoi?=
 =?us-ascii?Q?uPbMxSaDF1qUGf08AgUNw0pIwc3NblztxC7+OA9/GOwku+tqvv+8YJaSxIJc?=
 =?us-ascii?Q?zanMa37QlhrAemuV8zO8Euznm3FBUc/1PyiZEnleAyus3Cwh3Bql9TKSuQv0?=
 =?us-ascii?Q?8Xj/xoLIseZ+l6P1pkL0tEDl3JXY5MzmUcRYikEbhc3mPy+6qed+bZ01tC4S?=
 =?us-ascii?Q?T4PyBtEqNgR6UfZzbb4x4gpCA/hq7O4turatdKWXgLpyp54GTD21NJI1FLVd?=
 =?us-ascii?Q?NfYj97ET2gBGTC5SfTyHEtCnBmcHn7OeIwzJ83jAcmzoFRiR+/dsYVm/voCk?=
 =?us-ascii?Q?gMJzkM+xBkksS7rlTHM5dE43nnwXA/mv2f4ZBnP2xmmTCX+BziTnVw4WzSWr?=
 =?us-ascii?Q?pz6yoxqSXbJtGSm0HsXi0N73vP7/uEKsLyfElNlzVhBNVbLdr4Ranc/0idwJ?=
 =?us-ascii?Q?pxq9nq+SvkWQvqwrBT+82/DBYNVccseka1wK9pQZv5DhaKgDKAW+UsEXFRJi?=
 =?us-ascii?Q?5imz6YDfXFVwjR2xk7OeEhGYyymknwyCHAs0El/Y3O3WCG2S4zMRz9I0f5Vg?=
 =?us-ascii?Q?LU+sTUg3l32HBw1bcSjzumD7P+ai7lx34PdZ6Nfhhow5NAB8emrB08PPUY4v?=
 =?us-ascii?Q?D7j3kULeGHoMuJkS3kzraxflV3TJ0CVkwXKegEOrL7P3bTSgyj01pw+Aeqf6?=
 =?us-ascii?Q?JF4GzfdIOJFDDAyYVRQ/ycnBmLenzs86KGgp5pVFqz2BgeVIoYdgGn1YjmY7?=
 =?us-ascii?Q?sb7DZg1iLq8m7AU0vIBGa4jU/0OcM0eMyzue3chBr9C8gw1KxRDx6OoGqEGF?=
 =?us-ascii?Q?2+pBsofK7hg0bTnjVupqzikZtuF1xYMe4FTg4/S9rgg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB3686.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1344b986-2a3a-4d9c-269a-08d896c5d2a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 13:26:05.6952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEWUHFpqKE/BcrH/pepp9RAF12NesaxRc8kcoB8Hzut1xGCh/rXs5Q7KtbRAq5NmpIY62liX2k0y3i3ppJhDGIW6WOPkWIOjVuY+SDEJHxZQHLn5ifpKo6/uk3BRFf1W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3827
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, November 26, 2020 5:50 AM
>=20
> Further testing of error cases revealed that downgrade is not enough, so
> we need to reset the SCC which is done by calling the custom reset
> function. This reset function can distinguish between the various SDHI
> variants, so protecting the call with MIN_RCAR2 is enough here.
>=20
> Fixes: 24ce2d7b8bea ("mmc: tmio: bring tuning HW to a sane state with MMC=
_POWER_OFF")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch! I tested on Salvator-XS with R-Car H3
and confirmed that this patch could fix an issue which the SCC hang
issue happened when the mmc_hw_reset() was called. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

