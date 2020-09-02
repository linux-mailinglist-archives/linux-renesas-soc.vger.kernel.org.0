Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1DE25A8F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 11:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIBJvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 05:51:09 -0400
Received: from mail-eopbgr1310138.outbound.protection.outlook.com ([40.107.131.138]:3920
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726173AbgIBJvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 05:51:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0mucdgKebYunMZYXXI/0l9sQm0RW+6HnNtYS2kbRg+oxZSC6k2gnr7gAbRgIACqAZC/dBtkHKIJij8WnUrPUDVjEffoOm+s7fxXWnzp++hFZCYSmlCXm2Q57hBRbKbG1b3ag65/YlhG21FBUZGAn2Gy0rRAsqQAnxaJzM+7V0OjA3pTZeGxbAfgnNHMq6MFvaJIBBPE3STXRUnqhp571ussd317gxQIBeOpBaC8W+Cf/bfxR8m06JCOvm/tgill1gwj5GF95LnB5h91hR2Bw9e8wNsz7QDLML/uS4d11zBvBgxBUfjhOLLqKtjI/1O43ld0ueq0FGNHHrrPMa+NMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfcn7t90Ro2vjuY6h6HGmoixwn1muKV8IxbvqyztVV8=;
 b=A9/A2S5djSOyudYRNZJs7QFYZFM//5nQDkE/+AqaGJB1Ytzc7xVFaQ11Ztt47+qhxyU04Ohqy6buqb9SCayfl0ueFSEYO8fqqMmF/IrtPHwjlB+aSepWHQC1odIOKdPI84YCzLy47T/fqqIFSguTnFzzUyOfeLWmXROekzs3wTGvpA6f+GORqM1yhTjGaeru8xjI2UXl4oTs1CbOW3r79/PM50e2kK/oJDHnAEPuiBU34VOAcxNav3NSSL84RhmLWGAC9zkeH7om+gzJIGcfd0DA8IK748gjUKbnHzG/eAZqxjmiacczaMJCJzmQSVCm4gSc0G+EyC6HNgyueQV0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfcn7t90Ro2vjuY6h6HGmoixwn1muKV8IxbvqyztVV8=;
 b=Bgj9h6b62wE0ay+cOELy0f9FvOBjXO+dTwvS0voRs3CfF3NSCitTV4ZuosmcnuB2QLbdmQP4YXtpd/z67y5J/MW79rfQgEQRNYdgItyNVjdH/YAIt8ztXNi+mNig3xRKcDiOXTaEln8za00NcnOzCzSVNbD6NtlzyJcBgCAPQ2k=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2636.jpnprd01.prod.outlook.com (2603:1096:404:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 09:51:02 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 09:51:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/4] renesas_sdhi: fix hang when SCC loses its clock
Thread-Topic: [PATCH v2 0/4] renesas_sdhi: fix hang when SCC loses its clock
Thread-Index: AQHWgHD8IvG1abDPREWPL/ci570GkqlVGxww
Date:   Wed, 2 Sep 2020 09:51:01 +0000
Message-ID: <TY2PR01MB3692563894AD0A65B4AF37ACD82F0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200901150250.26236-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200901150250.26236-1-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: 7cda2d40-1a76-4dfc-bd01-08d84f25b3d7
x-ms-traffictypediagnostic: TY2PR01MB2636:
x-microsoft-antispam-prvs: <TY2PR01MB26360724FFC6A973EEE90249D82F0@TY2PR01MB2636.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: guzPH7j/uEqrJrdmQMYUEPwj0L02EGGw9YFZbVwWWsbGwmhRedIoUN0xBh3d52tVJL0ypcA1EqAwbzySuTt3HPU33mqJv3GfHLpxM4CuxICmILHfTdsL/7pL4Usf54GyZLF+4S8OmgjsaZEh3Jgs2Ryrj/swuffskyxl3Qt9n4x3/VxREjjhEgTznzIgWRIu52JP10l9eP2JbSaPaMqZplXz5o09xZ4nZwdw2zUojx7lpuodrh+k4CoUOoCl+XivCdZ3DlmUPWd3MhPJOn+2lXOpbplWol1/ovR85i8JW4CVlNe2K0+6NIoINE7J2HY7EyMrlcVQEzho+00phEatCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(66556008)(66476007)(66946007)(71200400001)(8676002)(4326008)(64756008)(86362001)(498600001)(5660300002)(76116006)(7696005)(55236004)(186003)(83380400001)(52536014)(110136005)(55016002)(9686003)(33656002)(26005)(6506007)(2906002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Pktlpi55z2lnLXH8vPc0Jrm5VqiwPfkfFalu5wpV0B8TxPR21jubqPKBE1xX+ZM76VGjIl/gtP5PMnFn8vUagV5vmdj6QEFTIHf1pIPR/ItIlUkmFOsBnEtWN/DzZMBXDfaV6TtvTqXIpTRqQW33NKTISxiC7Gi6trjj1aGIyd7u5ZPBt/u3EZNUMRr0XzDF8t4XBxm9eBd2S2ezs5lA5cR8jhJQ6bUfwqSGUK3y4eVQn/ALJ5jl8UWf2Dl7OmGbCdjqYgCF+CnDBkTPls/g1/+sOBR0hryf0H2IyZrBxWKxIPcKssqRzfvsat2257vntFw5mbk1ng5d/tyQH9rTAfr2WaXDFlahZn5VYuQUNBp4xt+4RBz+AzRvWKUO+PDInQZd4T8LPrJ0yLycplou6sg9hGhZIBJwk8jwDS7ULsZvBnNegR3PGY9KuII3b7kerhXEU6GHYLURjuzgK8J0JaFDE8WOldYXs+leTOEIjM/tXVPayuJ3o0duN185RBuW6fIXK5coS6GypMIOQxRoj3qcQYiMHgzwYccaXNAn5w/cJG/NoQCDcW+m13UqkgJJB1LJLY53aiZrqRPLE9iQsfU3wMfaphHOB5GdMywju5lcVWX/ChqtnZnIP+w93Doz76AE3aUOYGtLq3fmhZjBvA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cda2d40-1a76-4dfc-bd01-08d84f25b3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 09:51:02.0740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: filyx6FOsWHB8iEBLh6HL1juDYxG0vRS1WWN/LeXlX2ybBjja60yi7hpnUJLVHR86xSJ2d2FTHg6heDSSIkwWcFH/soscZs7rFbSRHOSto8M1XYpe/NqXWFLC6h6jK7c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2636
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, September 2, 2020 12:03 AM
>=20
> This again took a while since v1 because the issue was so hard to
> trigger. But I finally found a way to inject the flaw, so this series
> could be tested and it fixes the issue.
>=20
> Changes since v1:
> 	* introduce a new flag to MMC core indicating any kind of tuning
> 	  not only retune
> 	* use the new flag to keep SCC flag active
> 	* new patch 4, minor cleanup to MMC core
>=20
> A branch including the DEBUG patch can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
new_manual_calib-for-5.10
>=20
> If you revert patch 3, you should have the SCC hang during boot again.
<snip>
>=20
> Tested on R-Car H3 ES2.0 and M3-N and patches based on mmc/next.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this series on R-Car H3 ES3.0 and M3-W+. And,
I confirmed this series could fix the SCC hang issue. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

