Return-Path: <linux-renesas-soc+bounces-32383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GO8A/7oAWoRmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:34:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BD5103BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC68330215AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816B43FD147;
	Mon, 11 May 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="lRdocbeT";
	dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="TjZoanyN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632A3FE356;
	Mon, 11 May 2026 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.180.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509168; cv=fail; b=LrXdyPytX/ONTnS5k4/6ys5sa2/ErpRPPWdg+0XK/w1GVpATjO2cyenGnxBTQORS+NUwnnT9mlxgh13J6VomdxMVuEZs3FZ4w0C8x91oKPzQJbeoi4j6Ec5EMEwBLOjvMGcElVbevU4Rx7sjaXDv/FxFO1iqfNKhcPUKET6+xAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509168; c=relaxed/simple;
	bh=a2TCUdBzMBAvWxcMxE6hCfVkEw+jzCsQuMdHT28851A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o31E5+mpJDlDuBpRupTjxfCZLu4YLP/Zs6YUVoLwH5aHBdZwY/viTeFIi+2f7kj8kLWWtfZ430tDazctB2GDIrgIk1du2Vdl0anxnrA2LmwX4cr2xis/DhvmY7ruguY9Mdj6MBAHUcbuBNAk+YxHmuJ0qGp+PegQNt8IN2n4wu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=lRdocbeT; dkim=pass (1024-bit key) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b=TjZoanyN; arc=fail smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BDGQ74205491;
	Mon, 11 May 2026 15:05:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=dk201812; bh=+53FF1tCQ1FzZVQ5fKZwTTmbh
	hPR7XICLytrZkUZYdo=; b=lRdocbeTVmnyRH8uEyKWrTxLC0eaotKzZIPnhNf9q
	8nNVmIuQTnYB24rl3wQtJNIG/kC3RtyTgr7fTu0mvXjaW2cJl4yFo+7hmF0rq7os
	d/G4ForpYcX16A8wEL8nWzLMKLLM9EAu+ln5pKIfpeP03w0IlwsSJWNmW3M5t8xw
	4YNHmFrs44Mq0mOu4FHED1O+2epoEQCILVw5rK3a2avjDBSzGRI6MvxFefYcEzCs
	lm2kAXBw9eIoM18EQ48GPbYeX7+XDH+zVLb10LnFq+rFEBLaIVgGyuaAG+gKj2Zq
	oAjQF5MZlIA6fAHgCKSiXqxzUv7dlK2VlLvOOVBYunImg==
Received: from cwxp265cu008.outbound.protection.outlook.com (mail-ukwestazon11020085.outbound.protection.outlook.com [52.101.195.85])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4e1w0t1rd1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 15:05:58 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqwv/C7mEga6z979baf6UUNOOdiEWkfTKTIteFgQL2mCydCM8j0jIRrtDzzpqk6vActArDeFHI0Ncn7Pocjg9w3HhvFnO5Pu7a3M3A5ePE2qVkO5SBtwk33+ZvTLfm20drcB7ycsdk0aYi9uTn1kpLO6tGLXdVt1MNxtivAu51sH77VuR7tmIMGaK+FXAW3EJsDgPzsk6qqh2jyCLaUAa3XJkX/38t5ZycHNM0F0gKF4i++CybYddQK8l9xs2CLF4TKpLpU4Xxq8VMdmj3XJt24/yCdmm4e7rKc6ya12yh77dkY+C22uOQrLiY/Z5JMffSp9nsi3RaLt4c+uQYS7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+53FF1tCQ1FzZVQ5fKZwTTmbhhPR7XICLytrZkUZYdo=;
 b=VUWHzOrBZ/Lb9QYpI5/M+k5XU0p6ACJp6tCdd0NN5V+SwnI15393mT0YA6aWqMXSDTlpDQ/AfRyFkz/4AFYW5P5QZjBiuY+sTEo1Vi1ZBgF/vQQNO2W1VLo5urmFPCsWPavZnjW7vDoywC4YY4KdZY/v+I1riD1fAAlKyeNPKrEQ1SC0uw2CFtowsewEqBTiIUEyVMNaIkOEvj22JmG8jctedvvJRhexFMaccndn/PtWCVhhjVxNEBE32pKfVuI4fgyWaoZC1JI7nqwRIEaimk06FOLLU4fcL/VjkBZYTVLCzzkHJMHkESpsKIL8N2kHm8bSCX6R+lxxYqEqFrm5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+53FF1tCQ1FzZVQ5fKZwTTmbhhPR7XICLytrZkUZYdo=;
 b=TjZoanyNwVpHe5rfABT9s5fV7VdNulD4aDfLAp5pe6raxGBrt1Fez2uwgph9R4Zf7hKbaAvaWTuOCHgVZGspRDuJU9bYWqiCgoTuExwLMSnBn51kMwHTvJ8Fnqm1yZCslMSm92OnYwImIr39jJddipqDw6tLg/+WN1D5Ew+AS1M=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by CWLP265MB1908.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:49::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 14:05:54 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:05:54 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Adam Ford <aford173@gmail.com>
CC: Frank Binns <Frank.Binns@imgtec.com>,
        Alessio Belle
	<Alessio.Belle@imgtec.com>,
        Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
        Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
        Luigi Santivetti
	<Luigi.Santivetti@imgtec.com>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "drm/imagination: Warn or error on unsupported
 hardware"
Thread-Topic: [PATCH] Revert "drm/imagination: Warn or error on unsupported
 hardware"
Thread-Index: AQHc4Uoigk51SccbU0CSPQdy/Aoi1bYI2/qA
Date: Mon, 11 May 2026 14:05:54 +0000
Message-ID: <f46eff18-4a5c-4c25-a0b7-71cdbd444014@imgtec.com>
References:
 <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
In-Reply-To:
 <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|CWLP265MB1908:EE_
x-ms-office365-filtering-correlation-id: e4a9046a-bf10-4741-a34d-08deaf666a9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|6049299003|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003|3023799003|38070700021|4053099003;
x-microsoft-antispam-message-info:
 iwc6E+PYPsA+/q1sNNdxnHJcC9zRfqJoiqJa/g0Ea6yfiN8b77E8tPy/rrPj0tpxAgnapVBu8oaXDUciJQo/gg3TAkEyJJxid8l1etKzfuzrQzR0wI8oT6hHGDBW8107BTM4eeGDj6Gwl4z/A4BM8vBPlCgX2WUkhV8kEAFrY1laQpNbCMz6PPuKr0y9N+JbzC98kdxhcVfhZiJsiPsEiooiGiyZk6g6M7DgaWJmxeojDzq6eEgS+tVXL2BMM7uiCFIj7oNmsZt1xmEkA232PLEC+b9j8qqV4bejCMtN4Fo787RBJWoEMeHCUtmPiS9CaqKNDgMNFSorlqRMA1EZZlnYBiZsKlbjaE426hzLfBe06wLxziNanbaAynaZ2vEI5lxvuRnvhh/uypQLJuht3VzjujGIpDu3PnjCdOfaR7Yts2iYJRmpclFvMuIBQr8jAJ9DVkYzAjho5oureqnabdFli9u6051GXZINNhjUCXdCC8LqOYVDGpE5Vdj/pmquwMJzdxe/FSAQv9Fj2bpfbiMhS/x/gw9sYFGR0j1hCNErrv5zBLvYaIupGGJICm2B9S0WwOAelxUR534WB22WP+Q61NRqHkBj7TuTB7o++dNAXjbDWfmcGGNkivI7D/cTik8LWS+zisPhay8IpjM5Euz/B+bnLuAFi/gbBDZOYfmsA+kOzmdsY5wnqSfkAYzQBfXNAm4yWNBigQswRj6MAw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(3023799003)(38070700021)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnBqUGJnOTQ0V2NpM1cyTGRrWE1lUytSQTE4K2lUUy90MmFiOHBMeW9NUVdT?=
 =?utf-8?B?cWh5czBEbStqdVpKZnJJb3Fma09ZZnpyNnhKSjFOQnBKMk1jYldrLzVIQ2Y0?=
 =?utf-8?B?UFE4cHZUZnVzY1d2YVhHUmVqTGdBZEpHcGJ1ZlJJK0VFQXh5dGU4MFh4NUNY?=
 =?utf-8?B?TUdyUzgzOXBYL3FGa1JxU2d0VDVQNndQSGNQNExuNmZzTEtVSjlOcm00dHNF?=
 =?utf-8?B?b09xOU8rWFZMUnQzdFZnL0VUcHJvOGR5TzFmc0JlMzEwWXRWKys1eVI4RHNt?=
 =?utf-8?B?K3U5K1B2WWJHUk1Xd3FNbWdGVlpRdk02RmxsQ0ZXckNBMmp5YlBidVlzK3dt?=
 =?utf-8?B?UUlTYlk5OGIrZVJZbXRvL3pVTUlkR1FlcXpienNLelJOK1d3bmVmc3JKL1NV?=
 =?utf-8?B?RnovZ2NrK1pERjZyNVNjbzU2YlpJbXlIR3BkT25YbWpVOHdKMWlTcVhkU0xj?=
 =?utf-8?B?U0x3dXJCNER0V2FscWgxZjkvQ0dPUUhZUUhHR2ovRFQxZ0dSbXUxY01CREsw?=
 =?utf-8?B?a0NVQkhVaExPcmhWNUdiQngxUjkzVmt5aWwzUUF5T3VSWmIyT0xyL3Z3L2Qy?=
 =?utf-8?B?LytoNzY0OEJaaHhRNFJmVFdHMUlOSWNzQzQ0Y2ZFZDdRSVFxQ1NzVllKQlFM?=
 =?utf-8?B?SjNPY0lzb2NOMEQxSFU1ZWFNalhMZVlDNXdUMFNyalorU3RCM05sMkFWczRi?=
 =?utf-8?B?UE5ZaUxyS0NvSmU0QWFIdU92MjRSMGU3MWgwdnZkOGN2OFhKbjFDUjg4aXA3?=
 =?utf-8?B?TFNTRi9TcXdqZDhKZDZQRGNvVXh1VG9IRnpScjFqc09nQVhXNjdWdlIyM1Mr?=
 =?utf-8?B?OFhoYWdQY0VKcDFISDA4NnFlc1EwRDFPL3NJdDZ2UmNiREV3VnBhTjQ3WXRu?=
 =?utf-8?B?K0lWd2lQT2lTYng3SFUyZ1E3Z1FPN0x2aHBQMksycnd0b2pPV2ZOVWxKYnk1?=
 =?utf-8?B?UGdzNDZTYnhHS0Ixb1RMZEVzSDNtUHovTGI2S1c5TFh4RUx5RzdBdUZxQkx1?=
 =?utf-8?B?ek91UkdUK3NtZjRkUURCZmVTTlUrZkk1eTJwaGJjeU52QjJzUDN5dEk2aFlQ?=
 =?utf-8?B?ck0rTzc0MkVQOUplRjdvR0lmMzBQMm1PV2NZZk9PbWFIUDd3RlM5ZlZmeVpx?=
 =?utf-8?B?ZHpNUWFZZjdMalEwSHJTRTBVK3pVbkx5a3RSeWNZUitpUzNVSjQ4ekV1N0VQ?=
 =?utf-8?B?WVR4cm5uQVE2VUZtQ0dVQW50bFZ5aVlkTi9GblVwY3F5TTh3ZjNpdWRUWER4?=
 =?utf-8?B?U0NRWWJLSkhRYTkydGhUZkRRdXdWbm81YmV2eVpVZmd3bDNrYVV0dkVVcGFj?=
 =?utf-8?B?ZVRUTkNXT0daWmlJbGRFd2xxdUdvMTlQVmdvQkV3a1hRZ2pOSEVFSWYyWDhR?=
 =?utf-8?B?WlljdjBRcUNVVW9IcVNFaTB5ck9YNmxyekxEdCtEMHgyT0tJNzcxaUkrOWVi?=
 =?utf-8?B?cXlldjFKbXJuQVZDL1p6MDcyS2kxOEM5eXJiaGMrWnVpNE1FdGpXNjl4clBT?=
 =?utf-8?B?c1dpUGRZRmRXY0M2NUZseVB2bVYzeVlRWGZ5TmV1ZEw3cTVEQmpuNnpaazBU?=
 =?utf-8?B?R0UrNHhiMlo4dEUwaWc0V1picUhYaGllUzNHYkJ5TWZvOHlNUlp5a2wvTEVL?=
 =?utf-8?B?UXA2ZzdEQ2JlWHRWY1NiVnZzME1ZeXRhOWRUdVk0SDJHTUNpdkE1dHFqZXM3?=
 =?utf-8?B?MWxSK2tjTTAxNUhLdUR2Z1BxcmhpckJSWHU2bG9GMk01bGVOemNWc2s0TzJp?=
 =?utf-8?B?bXFtckVZU2owKzdFemhyWnl6TlUwSG1TN2hiYVAwQUFBc25zYWw2OG5BMm1M?=
 =?utf-8?B?ek1GV2diS3VpcGk5Q0RGRlc4WnhYUzRYQzNSZHRCKytQbG5Ta2xRMU83cnlD?=
 =?utf-8?B?bGNaTndBaHNvendIckJ1QnNNOEFpOVl3L0lmYlZvZXF2cGx1ZTBweUViNkpT?=
 =?utf-8?B?RmFZK0dhNE1OUmtoWWtRZGx5UFBlTkROeFFDZGttb3VkckdoMVNCZW1iRm5w?=
 =?utf-8?B?RnlGallxcFF5YWxxSlBERXkycEV0bWNQalFnRzZpL1VPRjFIMCsyMCtxNGRt?=
 =?utf-8?B?UmwvRzhTUzRKNnRvUTYwZXBYZ1hoRFhNZEpBUDNBU1JjNEZxQmhLZ2JjYjFl?=
 =?utf-8?B?U3dZWU5tVFpvOGhEQ0x2REo4T0tmdFZUdHFtS3FuZDRobHF0RkVRRkpsVU4z?=
 =?utf-8?B?R0gzcGJxM3pGS0tIZlRtcmtwS1pXd0w3S2FScU1NaXNvWWdMWWg5QlVWWksv?=
 =?utf-8?B?RVZQenhjbTNzTnJncElGTzQ4dWo2NW1ZTFJBVFdlTHNVYzZJWVIwRCtaejE1?=
 =?utf-8?B?UnR4a2RJR21UZmpHWEZzeDNvVy9BYlhRZk9WemdmUHFKVDM3QSsyZEhnV1Yx?=
 =?utf-8?Q?lJ64EO4judrQO0AQ=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------VQSnuYHT1A8phE1mvLUC9SXp"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	I+I+yV+7tAlD5nc9LPwsTPYw/WIP65RAf+IW5uuzslzSDWe6gvyIxlKfAj7Mc7a1DvBuZTtqzHG9KmLD9LB8nB8L+Uvs0XxRm6rEq63TdHR7QnRdzl49vuWU1UBF2IKgtpt5+eQY0Peqd0sVaCP198o+Jmao40UG5Je1hZ4x6BRZZOAjlX+R6XRzrp8kynI5SY8BcCO+haI2+cDi9lyrLO85Dzgqs9KSI2oOSQ22q1SwpQf0+8ab1W6kGOGGzBUfpM5GkpDSHuzgswwdsnL9KLoAIsCBVw7ybH1kJ6neKZJWy6dPPRX6f12PScikPvkxsJzkaeSSKk+tA1pYJoA5qg==
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a9046a-bf10-4741-a34d-08deaf666a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 14:05:54.3099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6T3MMv6iKzWIRUCnyKWmX+4EpPeKrovXi9X6EK7yI4mfNMsXsseyT23oFYp3BTrt8/A/T/6kHsFT0PVySjwVFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1908
X-Authority-Analysis: v=2.4 cv=b/6CJNGx c=1 sm=1 tr=0 ts=6a01e246 cx=c_pps
 a=RWxytQFfVy3xqte4PtalWQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22
 a=7RYWX5rxfSByPNLylY2M:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8
 a=r_1tXGB3AAAA:8 a=GhN_bxBG-qxmq8S7-IkA:9 a=QEXdDO2ut3YA:10
 a=6uWr6hFXe90DIWwu-w8A:9 a=FfaGCDsud1wA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NiBTYWx0ZWRfX4frGxx1NR7Ls
 BpsBtxb3hWRX938kSAksF+sUbxOAKt5S3I0SyiN9nASLVi9QVcKadpa/1BBjCF1AHbdl28oZ2Y1
 aBDNhUaAjDxvVGp6/mM1tYQwTjemj5fojpi80IG+ItCwi5ipmTG2bBMwp3u/h/Bz4bMAZAbg4pq
 cME6nj/mnGN1WqSVsrX1wtY6MDxaFvI8vZ8oqro4DMs0pdnVvKB78GjYg6oDt5U5Hi0DTL8udPq
 uKmx9oMgL56ESUO7QyKjPCsxk0kxlLuyncIvw6lDtGiOAeoRmRUhsl3VBG1CpAsOid1contCl5k
 AYqqv2Ps+S+7xQFrk+bMqDfjbLDz1P6x/jkZY2iitZMNOP532hbBuzCqOReKtAzxA1K+xwgFyWw
 kWPOgpqy1lcjVd+4nYPjscaBz4SsXM2ObtfMM+IA7uYrFlPc6RRMkZNxqOgcedJPAuyr2Vk8otO
 4rZE6z4pm2LdFVF/hMw==
X-Proofpoint-GUID: 1rEUJ_VZl__nCT5B2OgxUfcjrMAJ2Owz
X-Proofpoint-ORIG-GUID: 1rEUJ_VZl__nCT5B2OgxUfcjrMAJ2Owz
X-Rspamd-Queue-Id: E09BD5103BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32383-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:mid,imgtec.com:dkim,glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,mailbox.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

--------------VQSnuYHT1A8phE1mvLUC9SXp
Content-Type: multipart/mixed; boundary="------------1R3kMJBGKWI4aj7a6bDMeI97";
 protected-headers="v1"; hp="clear"
Message-ID: <f46eff18-4a5c-4c25-a0b7-71cdbd444014@imgtec.com>
Date: Mon, 11 May 2026 15:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/imagination: Warn or error on unsupported
 hardware"
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Adam Ford <aford173@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <caf5e011a5b3fbdbab8c50d064bc8342212d5cc1.1778505897.git.geert+renesas@glider.be>

--------------1R3kMJBGKWI4aj7a6bDMeI97
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On 11/05/2026 14:28, Geert Uytterhoeven wrote:
> Revert commit 1c21f240fbc1e47b94e68abfa2da2c01ed29a74d, as it stopped
> the driver from working on various Renesas R-Car SoCs.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> DT binding documentation updates were reviewed by the drm/imagination
> maintainers[1][2][3], DTS additions were reviewed and/or acked by the
> drm/imagination maintainers[4][5][6], and firmware is available[7].
> Note that the GPU nodes were not enabled in board DTS files before, as
> not having suitable firmware installed under /lib/firmware could trigge=
r
> a crash, not directly related to drm/imagination driver support.  This
> was fixed only recently in v7.1-rc3[8], so board enablement[9] is now
> unblocked.

We will freely acknowledge that the sequencing was not ideal here. This
patch should probably have been sent before we started accepting DTS
changes for those Renesas platforms. However, the purpose of this patch
still stands.

We're not saying we never want to list all these platforms as
"supported", but we don't want to mislead anyone into thinking the GPU
on these platforms will function in any meaningful way just because they
now have DTS nodes. We were originally convinved to allow these DTS
nodes to be added since it would facilitate active development on these
platforms, but this does not mean that we as a team have the bandwidth
to do that work ourselves at this time.

Our main concern is around the UAPI: we don't know for sure that support
for these platforms (which are significantly older than anything we
currently support) can be correctly implemented without UAPI changes. To
that end, we don't want to back ourselves into a corner where the UAPI
cannot be updated at a later date.

There's a similar mechanism in place in userspace: the user must set an
environment variable (PVR_I_WANT_A_BROKEN_VULKAN_DRIVER) to use
platforms for which we don't promise API conformance, but just like in
the kernel, this is not a compile time option and any user and/or
developer can enable it if they know what they're doing.

As for "it stopped the driver from working", no it didn't. The driver
never really worked on those platforms, at least not in any useful way,
and certainly not sufficiently for any non-developer user to benefit in
any way from it. The only change is that the user must now acknowledge
that this is the case to clarify that they shouldn't expect much (if
anything) to work. Just to be explicit, "firmware boots" is a loooooong
way from "ooh pretty triangles".

Would you prefer a different approach to providing this information to
users, perhaps a purely docs-based solution? I'm not convinced that
would be as effective at preserving our ability to mutate the UAPI for
these as-yet-unsupported platforms.

Cheers,
Matt

>=20
> [1] commit 18ff1dc462ef6dac ("dt-bindings: gpu: img,powervr-rogue:
>     Document GX6250 GPU in Renesas R-Car M3-W/M3-W+")
> [2] commit 6126a7f27f002408 ("dt-bindings: gpu: img,powervr-rogue:
>     Document GE7800 GPU in Renesas R-Car M3-N")
> [3] commit 67549b73f10b8517 ("dt-bindings: gpu: img,powervr-rogue:
>     Document GE7800 GPU in Renesas R-Car V3U")
> [4] commit 73100fa8e4ce21cc ("arm64: dts: renesas: r8a77960: Add GX6250=

>     GPU node")
> [5] commit 6e20a9d94a459b4e ("arm64: dts: renesas: r8a77961: Add GX6250=

>     GPU node")
> [6] commit 303a5185e024ee62 ("arm64: dts: renesas: r8a77965: Add GE7800=

>     GPU node")
> [7] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/po=
wervr/powervr
> [8] commit 26735dfdd8930d9e ("pmdomain: core: Fix detach procedure for
> virtual devices in genpd")
> [9] https://lore.kernel.org/all/20251027211249.95826-1-marek.vasut+rene=
sas@mailbox.org/
> ---
>  drivers/gpu/drm/imagination/pvr_device.c | 73 +-----------------------=

>  1 file changed, 1 insertion(+), 72 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm=
/imagination/pvr_device.c
> index dbb6f5a8ded12a42..b7984563627de753 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -508,77 +508,6 @@ pvr_gpuid_decode_string(const struct pvr_device *p=
vr_dev,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(pvr_gpuid_decode_string);
> =20
> -static bool pvr_exp_hw_support;
> -module_param_named(exp_hw_support, pvr_exp_hw_support, bool, 0600);
> -MODULE_PARM_DESC(exp_hw_support, "Bypass runtime checks for fully supp=
orted GPU cores. WARNING: enabling this option may result in a buggy, ins=
ecure, or otherwise unusable driver.");
> -
> -/**
> - * enum pvr_gpu_support_level - The level of support for a gpu_id in t=
he current
> - * version of the driver.
> - *
> - * @PVR_GPU_UNKNOWN: Cores that are unknown to the driver. These may n=
ot even exist.
> - * @PVR_GPU_EXPERIMENTAL: Cores that have experimental support.
> - * @PVR_GPU_SUPPORTED: Cores that are supported and maintained.
> - */
> -enum pvr_gpu_support_level {
> -	PVR_GPU_UNKNOWN,
> -	PVR_GPU_EXPERIMENTAL,
> -	PVR_GPU_SUPPORTED,
> -};
> -
> -static enum pvr_gpu_support_level
> -pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
> -{
> -	switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
> -	case PVR_PACKED_BVNC(33, 15, 11, 3):
> -	case PVR_PACKED_BVNC(36, 53, 104, 796):
> -		return PVR_GPU_SUPPORTED;
> -
> -	case PVR_PACKED_BVNC(36, 52, 104, 182):
> -		return PVR_GPU_EXPERIMENTAL;
> -
> -	default:
> -		return PVR_GPU_UNKNOWN;
> -	}
> -}
> -
> -static int
> -pvr_check_gpu_supported(struct pvr_device *pvr_dev,
> -			const struct pvr_gpu_id *gpu_id)
> -{
> -	struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> -
> -	switch (pvr_gpu_support_level(gpu_id)) {
> -	case PVR_GPU_SUPPORTED:
> -		if (pvr_exp_hw_support)
> -			drm_info(drm_dev, "Module parameter 'exp_hw_support' was set, but t=
his hardware is fully supported by the current driver.");
> -
> -		break;
> -
> -	case PVR_GPU_EXPERIMENTAL:
> -		if (!pvr_exp_hw_support) {
> -			drm_err(drm_dev, "Unsupported GPU! Set 'exp_hw_support' to bypass t=
his check.");
> -			return -ENODEV;
> -		}
> -
> -		drm_warn(drm_dev, "Running on unsupported hardware; you may encounte=
r bugs!");
> -		break;
> -
> -	/* NOTE: This code path may indicate misbehaving hardware. */
> -	case PVR_GPU_UNKNOWN:
> -	default:
> -		if (!pvr_exp_hw_support) {
> -			drm_err(drm_dev, "Unknown GPU! Set 'exp_hw_support' to bypass this =
check.");
> -			return -ENODEV;
> -		}
> -
> -		drm_warn(drm_dev, "Running on unknown hardware; expect issues.");
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
>  static char *pvr_gpuid_override;
>  module_param_named(gpuid, pvr_gpuid_override, charp, 0400);
>  MODULE_PARM_DESC(gpuid, "GPU ID (BVNC) to be used instead of the value=
 read from hardware.");
> @@ -609,7 +538,7 @@ pvr_load_gpu_id(struct pvr_device *pvr_dev)
>  			return err;
>  	}
> =20
> -	return pvr_check_gpu_supported(pvr_dev, gpu_id);
> +	return 0;
>  }
> =20
>  /**


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------1R3kMJBGKWI4aj7a6bDMeI97--

--------------VQSnuYHT1A8phE1mvLUC9SXp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCagHiQQUDAAAAAAAKCRB5vBnz2d5qsDFK
AP9mw6vmrdY0xQX/5cyZKrCbhAeZUk6VraRHou8CG/b9rgD/fXihGuf2wkk1szI3tAZJ1bvaTrQU
lSkQeLVxh/0mrgU=
=fm1r
-----END PGP SIGNATURE-----

--------------VQSnuYHT1A8phE1mvLUC9SXp--

