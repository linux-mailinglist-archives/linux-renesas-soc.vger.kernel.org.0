Return-Path: <linux-renesas-soc+bounces-22744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854DBC1129
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 13:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C6F2A34D987
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 11:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A169719E83C;
	Tue,  7 Oct 2025 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PiUQOwXd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CDE1A2398;
	Tue,  7 Oct 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835054; cv=fail; b=WRMx0Qd6P2WFUYjD6145Nv40Y+A56N+qUb8+GkU9WQLt4KcAyyfxdXMJhhOyhMPpoELiYWPIW1JW8wwsl031NpcI2pAlSary3VcKo3aW53hWID/eS08Oys6I+8qC73wM208Rw+WLRw3D7hsj/opnUgsiPVxMp2pgUBSHnIpgdhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835054; c=relaxed/simple;
	bh=gU+t33jiy/7KajsdaxofgF79KZ+ZreZZICwAIt3pkV0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BQ/Xe59L1qI5hay2MS080blzzHDgXt+S+8gzNfgA54tcchNnnx/21CN/LQas+XuDKbAaeknPz+wGocgLbfFkFNkAcZQje3lY2cdLQSMLTfBXFtZEzPFAIwpBmxRV3WvARMZaT20SLwk7Uegl/k8qNcJ0Frfdq7YV2dPKmSFu4rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PiUQOwXd; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPpCaWdS9BfgGwqDVyjB68zdcbGcvE2/5B/vSrHTFfZUnt5rt6Y8MgGmGA7TTI/vYIxmDrrRfnNNS54dAheM25OAzjt2bTinDKR34CIDMtN5o3N9uhULv4aPs4KDa6YekRzRWL4ExW2V+PIM/i8pgAg0xiBO4yPuYjIs4RsErtsvy5WYpq7a3tnugkH1E3HrtAlJROrJciN0SHAVIKKWTxNWQSPDZLTpIUSh7d5SdWUD1QjvUQq+iLypSxytlgB37DiVHQviEieoEoN7mkETa/bmxKISNtWeP+8sZTRnX2zYKkCM1Rn99rg4oDttS2irUIbiTNkZHSuqJGdPmgPkgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU+t33jiy/7KajsdaxofgF79KZ+ZreZZICwAIt3pkV0=;
 b=sAVeMwzulGjIVXzcvnfo9kxfn29NvCDb4b4ghg/z9+QJV8WqX6Gkft/5X4Kd23Z1OQ19squ4cYopS8mfdYMQeFl6djOh+l0WTr3aMapPbTYXaA1lPkOoofCi+P5nDcK0srLrVW09wN6/yhJuTKrEcIv0gb4H+gYshfUYIf7wKCRZcjszp/GcJpysa41JxM5ofr6q1EchQMVrsGgmMaLuTnxWAkMyUrJQcUXoUJU7h+lEKq0BPsINz7M22XPw+FcbrQSvUJZSkkJLF4mXoYXAe7CBJj29bmQLsVLgy/xD4pgHGrJkUoHz7OlKzyKZfl6F5ECQYKe6Rc/oBFR82+WqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gU+t33jiy/7KajsdaxofgF79KZ+ZreZZICwAIt3pkV0=;
 b=PiUQOwXdPkOvbxNtuZpeydL4Ez4zoePFXMoDIi5zmjEYx8iyW/EEoyN07Uorx4wUNFGNuj2zERFrvEqciF/Ig8EB5sUfgNpqOkLDuzwMm+Cb4rXCZNjEJkdFK/SVSu/TkfGs+FSP51OkffAiEIhM9qmgoyzrAYzoKE5AcAqmsmM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15695.jpnprd01.prod.outlook.com (2603:1096:405:2d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 11:04:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 11:04:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for OTG
 mode
Thread-Topic: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for OTG
 mode
Thread-Index: AQHcNt66G8TP9Ee94kC0LXwMMOw9YrS2DljwgABhwgCAAAaEkA==
Date: Tue, 7 Oct 2025 11:04:04 +0000
Message-ID:
 <TY3PR01MB1134623A14F4F313986F631ED86E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
		 <20251001212709.579080-5-tommaso.merciai.xr@bp.renesas.com>
	 <593eb851ae6ce0ec03ddeacf436180b6538fdd1e.camel@pengutronix.de>
	 <TY3PR01MB1134635745721CC005B35702286E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <01fc3101ab2e3898932afeaaaf060a6676cdf323.camel@pengutronix.de>
In-Reply-To: <01fc3101ab2e3898932afeaaaf060a6676cdf323.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15695:EE_
x-ms-office365-filtering-correlation-id: 493cb019-9b2f-42cd-ac24-08de05913a8d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?enJOWWxZa3VudG1UMVJwWmdwc0NBb1A3eVFxQVkzY0FKSGdVbWRlWDVYU0dv?=
 =?utf-8?B?bnVRczlTTlhwRk9qNTRxZVJieVZOVmE3dGJiVnlIdEVIZGtMY1B0UzBHa042?=
 =?utf-8?B?dVd5eU9jeVZZajNFdEdvYXd0TzAyTm8wclpxYWpVaHNzVWhTTkFtbGNlNVow?=
 =?utf-8?B?RVlyaFpuNTdEV2wyN2hjWE5DUlJEcm9yTHFyT0lTUHNrZy9pVXQ4b3lkakQy?=
 =?utf-8?B?R2pkMVZ5WXhqS3VEYmh1TTVDS1hReVNRenN0L0FtUXFyNmxoMlpEMEdFa3Fu?=
 =?utf-8?B?NHlrVGNTQVlmajllL3ZhVWxlRjkyMkF0UmVGYUtyMUd2NStTTGhDVmdxaTJ4?=
 =?utf-8?B?QndGZlgrbnVGcVFrSlhwelJRdjY4Z1pBQVI0emt5OFFqRlZ1anM0RjZvdG5M?=
 =?utf-8?B?N1FFUXdmaTh1YTVDUG1uU2JndUdNc1hPeENWWjJYL0dmeFFyMHQ1RzBWZGw2?=
 =?utf-8?B?b1Vpc09aWkUxcXlZVXZqbVJJbURXMElvWW1kcWxxS2ZmT3FNODIxVm55aEgy?=
 =?utf-8?B?Zlp4ZFFCcncxWFlNUXE2cm90aisxb2NwV0FhT0NKTnB4V3h0Q2QrTWpnUCtQ?=
 =?utf-8?B?YXZsaFlQS1REYmpiUkxyYkd2STFYZDRTTi9ScEUzeUIvclFTRnREdzhqZ080?=
 =?utf-8?B?VXprYzZxTWxBNThES2MxTCtYeTVWZ3ZvOWo2MlRGbXQxRUtrVTV0azdJSytL?=
 =?utf-8?B?UWYyU0tPY3Q1ejdoTHhrRmhuYW9LakREcVVBMFVaWkpzejllZUt0ZzYxWWQ4?=
 =?utf-8?B?VjBJMGUvSXR6L1hZNVFVaThVdCt6SExmOGcvekFFNVRLTmNQdVhRN1lEMHZS?=
 =?utf-8?B?WEZUNW02cC9vRUZaTm8xak5rOGx2VDFsMVFXK3BaWnJjMXg4ZHBaSTROQ1pt?=
 =?utf-8?B?QVlKTEdLU2dCeWNCTG0yMHNoZHBvRTU4YWtOaWZuN01XMHlnbnlGSjFyZDdV?=
 =?utf-8?B?b0xpeTI5UEtwcTlzeUprb0xKR3FTa2tza2lsa09wekhKdWlscndsb29zUkk5?=
 =?utf-8?B?WWN3ZVdaT1JxQWMxZ3o3ay9iYWlFU21OY1RrZVN5amg1SW1pVTIxSWlXSVUr?=
 =?utf-8?B?eS9pSWQ3YmVOWUtidUVDSUxyNzE1dW1iMERnODdkZDJYRnVjVTV2QTEwUGR0?=
 =?utf-8?B?Uk1ibG95OEJ1QURtVTFnTTI2TkM2Nk40V1FsVU9lRkhvTS8zRkptelpkMkJ6?=
 =?utf-8?B?VmMvaEFCZVZWYWJxb28yc0VCcEJSWS9BaGs5VDF0Um1pejJPa0lma1BScVlN?=
 =?utf-8?B?cUl0dkNoOWJtbWVLRkxaRTgrWnhOYXRieVFERlZzNGJoMkI3TjNIakJoRVhu?=
 =?utf-8?B?SlZQL0RDdWd6WkFlOWlZMTJiNXJmYmNTZURaclZGSXpVWnRhdXdZdzNkTUJZ?=
 =?utf-8?B?RDIrK1BoMklhVmNLL0UzbFE3eGtNOFVQc0d6ekNTaG5tdGd1YmZRTXRiSWNU?=
 =?utf-8?B?TG1NSGF0Nm5HZTZNVUErSnQvZXdlY2ljZmJIazI4V3daTm1pZG1YUlJtWDFO?=
 =?utf-8?B?Szg1OXF5SDk0UE1wdHhScG5mYnNhRFk3UTJWMkJ2UkVDcmdNbG5LV0xtUk5T?=
 =?utf-8?B?eXREUnV2N0NVKzN6NkY1VEFOMFlMcXpGdmdhVzVSTHhCbDNhQ2tDSzdzdzFn?=
 =?utf-8?B?OTdZMzcvRHlMQzBCQVRoRG1xV2FzNkxCQTFBNytOTW5EWGZ3dkl6bTRuMzB1?=
 =?utf-8?B?cjBNRXBEaXM1d0hwQnVMUjRuMnJEWldBL2l2L3owbEYybjAwSGRTWmdtNzMz?=
 =?utf-8?B?WmFOUWdTWi82MFIzc2xZNnpRNlFTQ29GYU9HekExejQya1Rmc05rN0Vxdmtp?=
 =?utf-8?B?a3RRUUhLUTdMamRJS2JUSjIzdDYrSFVOSjJMUnB2MzVWTjVUSjBwSUh0Uzdj?=
 =?utf-8?B?MUw2RGxNb2wwQ25ReFN3emd5RDFxSnBoekp2VGhWMlowQk9IOW1GTjRRNTRV?=
 =?utf-8?B?VDI4MnVoV2N0d1NvSnN0djFhSnB2VndtR0FHSTdKdnBuSTZieWtYYktQSU9R?=
 =?utf-8?B?YURrMjE4U1ZEZHVwY0t2cXFRSDR6b2V1R1ljUFJwVWw5cUxzdk52U1VXRUgr?=
 =?utf-8?Q?4RTQCl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVFqWnAzcXZPdmVmZlErOURDbjdlN1hvaFl4a3lnOGVMVlI1cWJtUk94VVBZ?=
 =?utf-8?B?czJLWkdSRG1GTU9KaXFIZU5lVWxYN0tocUhuTXhseVFsU2ZSM2xpcndCNGxU?=
 =?utf-8?B?N1EyOGJjVklON3YwZXczVDU4Z2plSnRzaHlhTUk0VGdLc2FVNVRNMitXQ3NS?=
 =?utf-8?B?VlFKMkRJSkgvbkJ2NWpqQjRkV29RRGZxOXBiQ1kwcHZUSk9uaTRMcWlMQ1Bo?=
 =?utf-8?B?bE1NUzVqVXZUd3VyaVJ3UWNEV1NMRHR0R2hzci9xeE9wZCttdVMvOUJQVTNp?=
 =?utf-8?B?Zm80WFZqUXg4N2F2U1RtclNWYjZGd29pSDBOSXBodjgrZVVHU05ic3Jma1Vs?=
 =?utf-8?B?dTNFT0xEU1ArYm5vNzdvYXpITktVRTlORWI2RDNaaTJzTVVlSFhDZzNYNFVx?=
 =?utf-8?B?V3FDRGNOSUhTcjNweXdkdkpyaUpWczE2YUl3SlBVZjhGRjdRWkVtMVYveWxU?=
 =?utf-8?B?Vng4Y1FtNGJVVFJVTnFlRjZacHJhdzVJQTArVFk2YmlsWlBlRWVGSkdOK3ll?=
 =?utf-8?B?Q3JYalJ1eDdYRGI1Z1h5ZFFXUDQySUN3MWNWelc1NmVVOTczUXBPeDRiMTkz?=
 =?utf-8?B?c3dKWGpEZWhOREl0eGN0VThRVVYyUHhEZHRuVm1FcVIyMTJpWnNRenFKMExF?=
 =?utf-8?B?dEt5a3VmUFgxRTFJc0xxUVdRYmZXQ0UzZUxRZERsdlRjajZLVmEyeENRd2hl?=
 =?utf-8?B?QWIxUGdGZGYvRWFZaURHMXZCaEU5OVZBVkZyWDgyejFMUWpiTW9hdUNuZWVu?=
 =?utf-8?B?SlNzbElaWWRYdUdUa0huSHV4YW41cVlQUHN3bk91b2NqbnlSTlA4SWpGTW1m?=
 =?utf-8?B?N1RQanN1VE9aRzNjR05TTGxSSDlpNTZYalJrN3NrbXluTFdJZmFwT3lMWVZ5?=
 =?utf-8?B?RlZKckt6cHRjQVJvUDlIbHBmVlRGOEZubTF1aWExTmJjYW1zRFpkcGlyOG9H?=
 =?utf-8?B?SEdyNG1ob2RPQ0NsSnJEbDJaNGlEVDRSREtkU28zMTg0aGpoSjd2c0M3UkdD?=
 =?utf-8?B?RGc4QTRxYkFDSWt6YVdQYjBBblFJRjYrS05qVFZkTlZKc0toTUxDd0lYdk5X?=
 =?utf-8?B?YTBBT2ViakRrNW1KTmUrekkxeGRlWTdXYW82ZFJHZjJWck1LUnZ5RWE5YmVt?=
 =?utf-8?B?ck1sTmlHMUZteWJNYWl2OW1DbnVvak11cVpWT0pOeEZOREFJbmJEcTl5MWsy?=
 =?utf-8?B?b3N4U21kOWlKc3ZybThVcEpMSktyeTVHY0V1K2YxbmtESVBxY25pc2Rld3ZP?=
 =?utf-8?B?cGNMakM3Z1QreWhYeWhydnlHMlV1bnFldHh4REZEdWxVR3VDTnZ0YTVheUhl?=
 =?utf-8?B?K05meVhkZGNINitHSVc4bW5WNEJZdnphWi9keHc4WDNNVlRJTkxqZmFTM0Fp?=
 =?utf-8?B?eTI1SDVIbjIycHhUNUtyNHNRTGVUOGZHZEhTd1FCQVRFRDhqN21RSXh6Uk1L?=
 =?utf-8?B?TVk3M2QwN2Q4Qjd1NVpOQ3FPdWYwWGRUcVE4a1JJa0ZqaE9saEtsLy9reURU?=
 =?utf-8?B?SEJqVFE2ZkE4R0tnNnJKRUNLckUzWi9GakNZWXJOSHJ2Tzk4Ny9rcHBWb3lP?=
 =?utf-8?B?TFNmc1M0VjlvY3Q4TGpuZnppVTNyMjJLU0tsSlZMb01IQU8vd1J3eEVkcGk1?=
 =?utf-8?B?MGhOVHhVRUE2Sm1ZMWRUWGhPN0taWUpOcEdkWmYvVk82T1J3SE1sZng1MnRK?=
 =?utf-8?B?RTd0RHovVWNHNjVjbEM1eTdaNm04VTVyQzNKaFRiMHZRL2hyQ2w3ckpTaU9J?=
 =?utf-8?B?ZlZZY2VBc0VKUjlmcWF6QW1qM3M4Wk11bXN6L2FadGhPZzBPdVZKNnRDcmQx?=
 =?utf-8?B?cjdPU2Y0WDdXMFFrYUJwd0QwWTAyRmo1WlFyTlphUHVjM1hNNUpKTWRjNGU2?=
 =?utf-8?B?cjg0S1pZeEdsZ3ZGdVFpOTNibzZoR0owa2RLdTExVk54KzFlck1kNzU4WjJx?=
 =?utf-8?B?b3lPWXcweGUvYmQ4eTg0Q0lEZVo4WXRWS3JpZW9tRi9oMG1lMGNaWUJ2WkdY?=
 =?utf-8?B?T0NPSmlUNDFzUGxtd0tpUThuQTZ5dGxJSDlaOFMrdGw2OFRGdjhiLy83WWpr?=
 =?utf-8?B?NFpTUTRadmxqbGJOSjUzUFBESS8vVmNmNnAxVUVzaDBqNFo5UHJnRDVLcnpa?=
 =?utf-8?Q?tcIlKyvrJoOB0q4t0luXEyJuj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493cb019-9b2f-42cd-ac24-08de05913a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 11:04:04.3592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdYyyBNk7AymHyoOA/ieZNBhhJY78ONFe+ERp4x2uBfVzh7xF3NrurXyEuLuCOGczhjjOCq9eMQ/0rtjMY5JgCQ9eNNsXs68XZ0089dOQzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15695

SGkgUGhpbGlwcCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAwNyBPY3RvYmVyIDIw
MjUgMTA6NDQNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNC8xOF0gcmVzZXQ6IHJ6djJoLXVzYjJw
aHk6IFNldCBWQkVOQ1RMIHJlZ2lzdGVyIGZvciBPVEcgbW9kZQ0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIERpLCAyMDI1LTEwLTA3IGF0IDA0OjAyICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4g
PiBIaSBQaGlsaXBwLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4NCj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gU2VudDogMDYgT2N0b2JlciAyMDI1IDE3
OjMyDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDA0LzE4XSByZXNldDogcnp2MmgtdXNiMnBo
eTogU2V0IFZCRU5DVEwNCj4gPiA+IHJlZ2lzdGVyIGZvciBPVEcgbW9kZQ0KPiA+ID4NCj4gPiA+
IE9uIE1pLCAyMDI1LTEwLTAxIGF0IDIzOjI2ICswMjAwLCBUb21tYXNvIE1lcmNpYWkgd3JvdGU6
DQo+ID4gPiA+IEFkZCBsb2dpYyB0byBzZXQgdGhlIFZCRU5DVEwgcmVnaXN0ZXIgd2hlbiB0aGUg
VVNCIGNvbnRyb2xsZXINCj4gPiA+ID4gb3BlcmF0ZXMgaW4gT1RHIG1vZGUuIFRoaXMgaXMgcmVx
dWlyZWQgdG8gZW5zdXJlIHByb3BlciBVU0INCj4gPiA+ID4gdHJhbnNjZWl2ZXIgYmVoYXZpb3Ig
d2hlbiB0aGUgZGV2aWNlIGlzIGNvbmZpZ3VyZWQgYXMgT1RHLg0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5l
c2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBJIGhhZCByZXNlcnZhdGlvbnMgYWJvdXQgdGhpcyBkcml2
ZXIgYmVmb3JlLCBiZWNhdXNlIG9mIHRoZSBvcGFxdWUNCj4gPiA+IHJlZ2lzdGVyIGluaXRpYWxp
emF0aW9uIHNlcXVlbmNlLCBhbmQgSSB3YXMgdG9sZCB0aGF0IG5vLCB0aGlzIGlzIGEgcmVzZXQg
ZHJpdmVyIGFscmlnaHQgWzFdLg0KPiA+DQo+ID4gVGhlIGxhdGVzdCBoYXJkd2FyZSBtYW51YWwg
ZG9jdW1lbnQgYWJvdXQgVkJFTkNUUkwgcmVnaXN0ZXIgd2hpY2ggc2V0cyBzb3VyY2UgZm9yIFZC
VVMgc2VsZWN0aW9uLg0KPiA+IHMNCj4gDQo+IEkgc3RpbGwgY2FuJ3QgbG9vayBhdCB0aGlzLCBy
aWdodD8gVGhlIFVTQjJQSFkgY29udHJvbCByZWdpc3RlciBzcGFjZSBhcHBlYXJzIHRvIGJlIGRv
Y3VtZW50ZWQgaW4NCj4gdGhlICJSWi9WMkggR3JvdXAgVXNlcidzIE1hbnVhbDogSGFyZHdhcmUg
KEFkZGl0aW9uYWwgZG9jdW1lbnQpIiAodW5kZXIgTkRBKS4JDQoNCkl0IGlzIGRvY3VtZW50ZWQg
aGVyZVsxXSwgUGFnZSAyMTc3LCBVU0IyUEhZIENvbnRyb2wgUmVnaXN0ZXIgKFVTQjJtX1BIWV9W
QkVOQ1RMKQ0KDQpbMV0NCmh0dHBzOi8vd3d3LnJlbmVzYXMuY29tL2VuL2RvY3VtZW50L21haC9y
emczZS1ncm91cC11c2Vycy1tYW51YWwtaGFyZHdhcmU/cj0yNTU3NDQ5Mw0KDQoNCj4gDQo+ID4g
PiBDYW4geW91IHBsZWFzZSB0cnkgdG8gZmluZCBhIHByb3BlciBhYnN0cmFjdGlvbiBmb3IgdGhp
cywgYmVjYXVzZQ0KPiA+ID4gZHJpdmVycy9yZXNldCBpcyBub3QgdGhlIGNvcnJlY3QgcGxhY2Ug
Zm9yIFVTQiBPVEcgbW9kZSBoYW5kbGluZy4NCj4gPg0KPiA+IFNvcnJ5IGZvciB0aGUgY29uZnVz
aW9uLiBUaGlzIGRyaXZlciBpcyBub3QgaGFuZGxpbmcgVVNCIE9URyBtb2RlLiBJdA0KPiA+IGp1
c3QgY29uZmlndXJlcyBWQkVOQ1RSTChvbmUgdGltZSBzZXR0aW5nKSB0aGF0IHNlbGVjdHMgdGhl
IHNvdXJjZSBmb3INCj4gPiBWQlVTX1NFTC4gQWN0dWFsIFVTQiBPVEcgbW9kZSBoYW5kbGluZyBp
cyBkb25lIFVTQiBQSFkgZHJpdmVyIHdoaWNoIHNldHMgaG9zdC9kZXZpY2UgbW9kZSBiYXNlZCBv
bg0KPiBJRCBkZXRlY3Rpb24uDQo+IA0KPiBTbyB0aGlzIGlzIGEgbXV4IGZvciB0aGUgVkJVU19T
RUwgc2lnbmFsPw0KDQpZZXMsIFBsZWFzZSBmaW5kIHRoZSBiaXQgZGVmaW5pdGlvbi4NCg0KMCBW
QlVTX1NFTCAwaCBSVyBTZWxlY3QgVkJVU0VOIGNvbnRyb2wNCjBiOiBPdXRwdXQgUFAgY29udHJv
bGxlZCBieSBQT1JUU0MxIHJlZ2lzdGVyIG9mIHRoZSBIb3N0IENvbnRyb2xsZXIgYXMgVkJVU0VO
Lg0KMWI6IE91dHB1dCBWQk9VVCBjb250cm9sbGVkIGJ5IFZCQ1RSTCByZWdpc3RlciBvZiB0aGUg
SG9zdCBDb250cm9sbGVyIGFzIFZCVVNFTi4NCg0KV2UgaGF2ZSBVU0IgUEhZIGNvbnRyb2wgZHJp
dmVyKFRoaXMgZHJpdmVyKS0+IFVTQiBQSFkgZHJpdmVyLT58IFVTQiBIT1NUKEdlbmVyaWMgZWhj
aS9vaGNpKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAkgIHwgVVNCIGZ1bmN0aW9uIChyZW5lc2FzIHVzYmhzKQ0KDQpXZSBwbGFuIHRvIHNl
dCAxYiBmb3IgdGhpcyBJUCBpbiB0aGlzIGRyaXZlciBmb3IgT1RHIGNoYW5uZWwgZHVyaW5nIHBy
b2JlLg0KQWZ0ZXIgdGhhdCB1c2luZyBWQk9VVCByZWdpc3RlciB0aGUgUEhZIGRyaXZlciBjYW4g
c3dpdGNoIGJldHdlZW4gSG9zdCBhbmQgZGV2aWNlLg0KDQo+IA0KPiBXaHkgZG9uJ3QgdGhlIFVT
QiBob3N0IGNvbnRyb2xsZXIgZHJpdmVycyBwYXJzZSB0aGVpciAiZHJfbW9kZSINCj4gcHJvcGVy
dHkgdGhlbXNlbHZlcyBhbmQgY29udHJvbCBVU0IyUEhZIFZCRU5DVFJMIHZpYSB0aGUgbXV4IEFQ
SSwgZm9yIGV4YW1wbGU/DQoNCkN1cnJlbnRseSBmb3IgT1RHIGNoYW5uZWwsIGJhc2VkIElEIGRl
dGVjdGlvbiBJUlEsIHRoZSBVU0IgUEhZIGRyaXZlciBzd2l0Y2hlcyBiZXR3ZWVuIGhvc3QNCmFu
ZCBkZXZpY2UuIFdlIHVzZSBtZXRob2QyIGJlbG93IGZvciB0aGUgaG9zdCBvcGVyYXRpb24uDQoN
CkZvciBIb3N0IG9wZXJhdGlvbjoNCk1ldGhvZDE6IFVTQjJtX1BIWV9WQkVOQ1RMLlZCVVNfU0VM
PTANCm9yDQptZXRob2QyOiBVU0IybV9QSFlfVkJFTkNUTC5WQlVTX1NFTD0xIGFuZCBVU0JfSE9T
VF9WQkNUUkwuVkJPVVQgPSAxDQoNCkZvciBkZXZpY2Ugb3BlcmF0aW9uOg0KVVNCMm1fUEhZX1ZC
RU5DVEwuVkJVU19TRUw9MSBhbmQgVVNCX0hPU1RfVkJDVFJMLlZCT1VUID0gMA0KDQpBcmUgeW91
IHN1Z2dlc3RpbmcgdG8gdXNlIG1ldGhvZDEobXV4KSBmb3IgaG9zdCBvcGVyYXRpb24/DQoNCkN1
cnJlbnRseSB0aGlzIGlzIG9uZSB0aW1lIGNvbmZpZ3VyYXRpb24uIElmIHdlIHBsYW4gdG8NCnVz
ZSBtdXgsIHRoZW4gaXQgYmVjb21lcyBkeW5hbWljLg0KDQpIb3cgd2UgY2FuIHdlIG1ha2UgdXNl
IG9mIFBIWSBkcml2ZXIgdXNpbmcgbXV4IEFQSSB0byBzZWxlY3QgdGhlIG11eCByZWdpc3RlcihW
QlVTX1NFTCkNCmluIFVTQiBQSFkgY29udHJvbCBEcml2ZXI/DQoNCkNoZWVycywNCkJpanUNCg0K
DQoNCg0KDQogDQoNCg0KDQoNCg0KDQoNCg0K

