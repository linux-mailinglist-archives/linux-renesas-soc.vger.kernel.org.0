Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A141F1EDB5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 04:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgFDCwT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jun 2020 22:52:19 -0400
Received: from mail-eopbgr1310117.outbound.protection.outlook.com ([40.107.131.117]:19915
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725951AbgFDCwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jun 2020 22:52:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbJOjIHFqYw48yOSCsBg0Pw/MZlkvTc4XDHdcVRwyJDspeobnp7FeuPAduOHtshjnuy7x37ohyKVNwJSf0GOEp5D0J7UUYA0MOYVtarZq7s5quMoT3tiCx7gPIlUuA687gAcLTEHrin481a7AVRLFeTQ0k8AvggrHqoU8YCNbva94sm7HAcuCCUQGaiavs8oMHyYnLLiE2RGmGGJyxg/ZCqnGYOZY5z3yqS3cd4WLiAuFmI115wbb8lV/S7MKVwiAxqq4DpuK7j+n8s96S1IXJSG8tLLMOG+Ln4C+3W4Hb6yjYgcol1+ziidlWqHDV9inP7FUu12qMyhDhoxj5BYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9YKBLfrofZm2FkWdKvgcuNvlp1YD7vIlyh5YEX65Fg=;
 b=CtG2886ovYbIlD4E7vzMcOTZazN+3iub+6CL0W3i1tE84qDZxm+2pHQFE8reTFi9GAObwykOyImidrJPonlwCH7pvAW4yzznZKtHA7HXR0mxRpAtuukwxntZfjgBVIT2HOFq4cIxA61Rp5aw8ROe5ap3KLkRIXwi0WTR4O2zVDOwLc45SBIMZsHI2QOQNRjhDHdhMnlIWvqjQ7Dgem0HZmEzDEwf8meb29dzlSU5xNzTpe67vEF8rHxI5Ojl97pfQJ5n+GkrLMCc3FXVKxmWDRCKlbYMlsGe9pFVzmoBeHZLleqce3laASKZ4Z3LSdwV4U8hbdgJy+1PQ+k27aaPWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9YKBLfrofZm2FkWdKvgcuNvlp1YD7vIlyh5YEX65Fg=;
 b=MkjKIA34dzom10F+q5AzDKu1HT5RIGZY2jfolvVSVIJzPaoQH4037v83OC1NSE9rafK1KUCINud+rHCpOIt+WMKrVf2L+I8Y5Q9dMBfLEGgTFHjLEwTIh1cHnGnvnwdiXT+arawQ0mpVxpvHlJzfGVmjy0jAbfVomtP0hrJxdFM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2812.jpnprd01.prod.outlook.com (2603:1096:404:6e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Thu, 4 Jun
 2020 02:52:12 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 02:52:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Thread-Topic: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Thread-Index: AQHWLz2iQ8JJHLYs4USF4zCo+Q8xCqiyJ38AgBMzGYCAAnsegA==
Date:   Thu, 4 Jun 2020 02:52:11 +0000
Message-ID: <TY2PR01MB36926A830866FEA2C49735E0D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200602125131.GA1318@ninjato>
In-Reply-To: <20200602125131.GA1318@ninjato>
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
x-ms-office365-filtering-correlation-id: 884edda1-714c-4641-f082-08d80832478c
x-ms-traffictypediagnostic: TY2PR01MB2812:
x-microsoft-antispam-prvs: <TY2PR01MB2812BFFEDF23EE4814FED7BED8890@TY2PR01MB2812.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QWgLHA3xgPtcQZ47Q2RNhzrlHpukuCs4KO1pW+kUqekAc3OuAcTa+hW1bl6QUhlCWNKUUxTbVV5Fddq6Z8ihLCU5HlQe/d3rX1O/kFpmT1IbOl/xgHBVZ35KfpoZ0cEYpclKlxn1Bw4DPh0SK5yYKJQ9oaMnyg1/GN3nSWNjLY14QNaupRly3G2ENKkq1xLo29sECYnRN6ZihS9zxqeIbOzp9Dc0GJbLWp1oAy+SEk0lwa9QKtdeT8HP1fCwJtkzpefBCXI/9gzoZH9Vr5pd3HjjR254oOfgTTYLP8oY91Z8dphocusAFN/BABaamloqdsslPHgC42kPDU6o7ShhHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(86362001)(316002)(54906003)(33656002)(478600001)(66556008)(66946007)(76116006)(66476007)(66446008)(5660300002)(52536014)(64756008)(83380400001)(71200400001)(186003)(26005)(55236004)(6506007)(4326008)(7696005)(8936002)(2906002)(9686003)(55016002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: UqW6721fsYg9+8pAROylmPyowRV5fsWDQS8h/rJ0BK5oPeKvfsDNEsQmP9go5cMRNcXynxn7OaVCQKIFCTeZ8a7kBaVVETZ9xWPFpBqkVoOrbSXosFuG7MagS4WPvfipjEfkrHKlK6fNxc21e8H0oYJammM8ubT4F1dJCrx1aktEuLg8S6kRn2dm+3gfe+d1UQozQn8i6bfPH7z7UNFbogSSIDjBAZ6in9BXvSBA/BUiDkqbVE0OKzLSIPndXpa/q2/m4smaSHJM5O3nBGg1FG+pN720OVEBs86KNLlplW1gK4KQEBKjFdBqm+1R5TcdVe9YQpVLk9j5qPxaODMS2u+if7Dlpj7ZuID4nzkc+d7UPqrO/vlwnQ+78jqkjZ603AWZi5mFqNUwPY2AMC+lAnMtqm3XeU9jt0sUFlMA6x6Nx1Ys8FgrLYM6hz3WDWWGzN2cVLiRshewe5IwhfvRKp7hDuY7DgZNYJI4oKVfn+0Xw3WzgnGC7NRA50ZC4cEL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884edda1-714c-4641-f082-08d80832478c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 02:52:11.3122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5F7OQWLSU2Zy0fOW7x4v3hUxMFH6VdOvDXisJ4ZYHAyJqA2rBO7YMUw8vdY8bvNCspgBv/zIB3NM1JqvBrF2zMa82ceKch3AzEzPX5yYxMl2zUZCyoaUgiByUjJgC62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2812
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: wsa+renesas@sang-engineering.com, Sent: Tuesday, June 2, 2020 9:52 =
PM
>=20
> Hi Shimoda-san,
>=20
> thanks for the patches and for providing a test case. I was not able to
> reproduce the issue, though. I'll explain...

Thank you for trying to reproduce the issue!

> > Note that this patch series is tested by using additional debug code [1=
],
> > because there is difficult to reproduce this issue. Before apply patch,
> > When I enabled CONFIG_DMA_API_DEBUG and CONFIG_DMA_API_DEBUG_SG,
> > I observed lacking dma unmapping on /sys/kernel/debug/dma-api/dump.
> > And then I confirmed the patch can fix the issue.
>=20
> So, I have this debug patch applied on top of mmc/next. I have the above
> CONFIG_ symbols enabled. I have _not_ applied your three patches which
> fix the issue. I mounted the eMMC and read a large file. I see the
> injected timeouts happening:
>=20
> [   94.079560] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting fo=
r SD bus idle
> [   94.088668] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting fo=
r SD bus idle
> [   94.097727] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting fo=
r SD bus idle
> [   94.106768] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting fo=
r SD bus idle
> [   94.115848] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting fo=
r SD bus idle
> [   99.300589] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting fo=
r hardware interrupt (CMD13)
>=20
> But I do not see any output from the DMA debug system about a missing
> unmapping. I expected that, though, because your fixes are not applied.
> The testfile could even be correctly checksummed after reading, just
> awfully slow, of course.

I'm sorry, I should have shared my log. My test case is:
- Use dd command as background.
- Read /sys/kernel/debug/dma-api/dump while the dd command is running.
--> "ee140000.sd" lines are increased gradually.

---- Log ---
~ # dd if=3D/dev/mmcblk1 of=3D/dev/null bs=3D512k &
~ # grep sd /sys/kernel/debug/dma-api/dump
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8274 P=3D736a8a00=
0 N=3D736a8a D=3D740a4000 L=3D3000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8603 P=3D736a5100=
0 N=3D736a51 D=3D74337000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
~ # [   56.797275] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting =
for hardware interrupt (CMD13)
[   56.857055] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   56.866231] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   56.875330] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   56.884313] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   56.893334] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   61.917228] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
hardware interrupt (CMD13)
[   61.967599] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   61.976722] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   61.985726] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   61.994847] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   62.003772] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle

~ #=20
~ # [   67.037259] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting =
for hardware interrupt (CMD13)
[   67.098616] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   67.107610] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   67.116595] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   67.125591] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   67.134819] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle

~ #=20
~ # grep sd /sys/kernel/debug/dma-api/dump
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8274 P=3D736a8a00=
0 N=3D736a8a D=3D740a4000 L=3D3000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8603 P=3D736a5100=
0 N=3D736a51 D=3D74337000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8807 P=3D737c2c00=
0 N=3D737c2c D=3D744ce000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8993 P=3D736b8000=
0 N=3D736b80 D=3D74642000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 9251 P=3D73665f00=
0 N=3D73665f D=3D74847000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
~ # [   72.157278] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting =
for hardware interrupt (CMD13)
[   72.217556] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   72.226595] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   72.235577] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   72.244558] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   72.253580] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   77.277235] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
hardware interrupt (CMD13)
[   77.339935] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   77.348953] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   77.358283] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   77.367271] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle
[   77.376215] renesas_sdhi_internal_dmac ee140000.sd: timeout waiting for =
SD bus idle

~ #=20
~ # grep sd /sys/kernel/debug/dma-api/dump
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8274 P=3D736a8a00=
0 N=3D736a8a D=3D740a4000 L=3D3000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8603 P=3D736a5100=
0 N=3D736a51 D=3D74337000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8807 P=3D737c2c00=
0 N=3D737c2c D=3D744ce000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 8993 P=3D736b8000=
0 N=3D736b80 D=3D74642000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 9251 P=3D73665f00=
0 N=3D73665f D=3D74847000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 9470 P=3D739af200=
0 N=3D739af2 D=3D749fc000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
ee140000.sd renesas_sdhi_internal_dmac scather-gather idx 9794 P=3D73686700=
0 N=3D736867 D=3D74c85000 L=3D1000 DMA_FROM_DEVICE dma map error check not =
applicable
----

Best regards,
Yoshihiro Shimoda

