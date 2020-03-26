Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9B0193920
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2020 08:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCZHEw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Mar 2020 03:04:52 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:35225
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726270AbgCZHEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 03:04:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8mZUuPj6AnvJu2tYDNj7W4wdZ68UAcy7QFFQrAg1mZKnny51PRoCKKpVgfW9oSMMrLPas6iZKSTXBPPFfuDFyVNe3SWoSbLMGWV+Uj3mkhpaCJ9dsq1HjK/fDLxwXZoJgwvamheiHEtyG9A2S+MHw7xW7IhovTn9B29yLL9GGb2mH8+jhvPEeaOjgP2FQth0Se8iLBMpk46EeIEckByEA/ppue67kZbZog8NWDe/W/RDoINE/B0XVr/lJP39/ABqC9Ms/Ve1tcQCk4O0dqv/uWYekmGH0DcFyUi3AwvdfcWdgmpMKSmmkVPDVfR6m3TVWVB90YgPfz9ZmcIjRU3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jWlHDRa1vnkhcagpXBSVzp+/BTHKowETSJS7kZ2pcI=;
 b=PbmjuD/YUckS+CApcF8TX6tQ8/L7vP/qWdFtWispJX/gH4SHsvHU2MbDGuMrt159NkxUM8/WlhvyKgfls55C1btK8mpBJuIF185rf5MaUBaaSJoU9tl1Rm499qz5TurjxxLRDCI8mO9AWse1qpTmnyFVHYW/l9Iuo41rJ+JWfmjSpEOZGlTFUUsZ1ocMF0WhMoUmgC7kQU6I6+RLHYmHG1HjioCTeq+hGSB1AhIMdo3qTlZXyZ+K9BFcerbZO/Z4VQnZCSr1WFZs/SxMadoV4Y9MUoL82ZkjHXYaALX4EzsdVeABRNF+y44vCkn9TJlDd8lWuoYmjjEAToT/dTd0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jWlHDRa1vnkhcagpXBSVzp+/BTHKowETSJS7kZ2pcI=;
 b=biZt9FUthSEMErYABlZoyboGpC0C/keBCyMP/nDdjrW2uhkowN3sAc9yCgABp6XS3d/WSqmqcMHZ39A81XXpEIr6kcWibyfiPaJmfP6MTgG+u7aDrluBJCBRttplXJ9RJkH+LLgQB+uW9PhMCaAfWD5cfXZ/ro97biBxHlNtQ+A=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5308.jpnprd01.prod.outlook.com (20.180.222.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Thu, 26 Mar 2020 07:04:49 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 07:04:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFT 1/3] mmc: renesas_sdhi: refactor calculation of best
 TAP
Thread-Topic: [PATCH RFT 1/3] mmc: renesas_sdhi: refactor calculation of best
 TAP
Thread-Index: AQHV85ocVte0Te/ye0aMRBFlKMUyZKhajF2g
Date:   Thu, 26 Mar 2020 07:04:49 +0000
Message-ID: <TYAPR01MB4544AD566F267EB89F479C3CD8CF0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
 <20200306093159.6155-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200306093159.6155-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ef3f1c7e-f752-4e61-db03-08d7d153f992
x-ms-traffictypediagnostic: TYAPR01MB5308:
x-microsoft-antispam-prvs: <TYAPR01MB5308617F592795435A7384BFD8CF0@TYAPR01MB5308.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(55236004)(9686003)(66556008)(64756008)(66946007)(66446008)(66476007)(86362001)(76116006)(55016002)(478600001)(6506007)(316002)(26005)(7696005)(52536014)(71200400001)(186003)(2906002)(5660300002)(81166006)(4326008)(33656002)(81156014)(8676002)(8936002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5308;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2k7fx/bjAxF795cSyhQMnoBqH6pIKFGGuT/Rp1FMk5RqODzD+So5s8jeQnLtu/UkIK2V+xc0+r1ZY70Tq/Lfo/vzpq2ERlJc7pRIASPEKUigBXehW3Ha9+CANLVAQxJqohmSSzmRTAGd3zqip9BVPzCrCb8wDE5VnUNnbBEf5p8ZkcUYQ7OcjLj5Hu+Ku2TXsqp/+pMCAcrCYipjOx9r9Gr47LGxu46R2F0XkdPUG069IfXtNUVI/HtiLGHg7A+DlvFZ6WB4E2cfweFNa4PYv8iDicpIDCQUFN9o0OL0rCiO/1TPCdi5A2Zty41vvCptbIMCbaiXGSpmoE3gA4eWPgMCC7MljdD/dcpVsmAvl6Tstuc+BFMUZ1cgEBM67TcGlz2Z8DA/BGpGlKu4BZoSBoYidUQCAZ3Rkj5Qt/q+Tz6tSrBvA4cj1C7VXx+Qhwar
x-ms-exchange-antispam-messagedata: H1jNuzgf+JOmSu5jBVU8Riez6fCTsQR6q2i5+62ds5n83MH2iFkCDXWMjaZuzC2SEqO/gy2jO8984dxBXHtkIc93ExX2zxNJGG0PXek1iZioDm7W8ARj2lo1akriwXE2kRY8N1FSPgnmOBGnsfJjpw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3f1c7e-f752-4e61-db03-08d7d153f992
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 07:04:49.4507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBUCuYpKKITf+k7rxYklsUpdN5C2MmaMwCMc/IrN9sqihCwFpzLUrGwL8+7B3t7A/j1hbT6pG1S7gWvCJk3/jcVMvBM3cx/UHZJOWciKnQ8WegoLvBhd0A/e90dMOOhR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5308
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Friday, March 6, 2020 6:32 PM
<snip>
> @@ -455,29 +450,14 @@ static int renesas_sdhi_select_tuning(struct tmio_m=
mc_host *host)
>  	 * is more than SH_MOBILE_SDHI_MAX_TAP probes long then use the
>  	 * center index as the tap.
>  	 */
> -	tap_cnt =3D 0;
> -	ntap =3D 0;
> -	tap_start =3D 0;
> -	tap_end =3D 0;
> -	for (i =3D 0; i < priv->tap_num * 2; i++) {
> -		if (test_bit(i, priv->taps)) {
> -			ntap++;
> -		} else {
> -			if (ntap > tap_cnt) {
> -				tap_start =3D i - ntap;
> -				tap_end =3D i - 1;
> -				tap_cnt =3D ntap;
> -			}
> -			ntap =3D 0;
> +	bitmap_for_each_set_region(priv->taps, rs, re, 0, taps_size) {
> +		if (re - 1 - rs > tap_cnt) {
> +			tap_end =3D re - 1;
> +			tap_start =3D rs;
> +			tap_cnt =3D tap_end - tap_start;

The left value on the condition and tap_cnt should be added "+ 1" like belo=
w.

+		if (re - 1 - rs + 1 > tap_cnt) {	// "if (re - rs > tap_cnt)" is more bet=
ter?
+			tap_end =3D re - 1;
+			tap_start =3D rs;
+			tap_cnt =3D tap_end - tap_start + 1;

For example, the priv->taps value is 0x0007, the tap_cnt should be 3.
But, this patch's result will be 2.

Best regards,
Yoshihiro Shimoda

