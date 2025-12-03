Return-Path: <linux-renesas-soc+bounces-25528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8D0C9E92A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 10:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5BC3A9307
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 09:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9416F2DEA72;
	Wed,  3 Dec 2025 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NdZOaGLN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B422D94B3;
	Wed,  3 Dec 2025 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755305; cv=fail; b=S5LXfntTq6llYvnabeZeXJja9jk9phqLtssoKihbBkFNozo2ljpy8sXyJj+I2fzO6PxSdAb4nu5y1QwjVs/f5/VS1O7ZBCGncGXBR+dNl13+xAqwjqObpFiIwwSRCdPTViErqQj6ReMETmBIC/I5lznHTa3QkTOCK7+LZC6A9P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755305; c=relaxed/simple;
	bh=CjIIkqPsBdbc0/Lh4VcoI+QLmc7ms7b4xwAjXA7sCGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JDa3BPqM+e567PW78oOiGv9g1BNvOOAdZolE2e3F5nuhzjWWPoLQXJnX3wQWqEyCeGgVRyalukRRkLwzU9g/TAwZq6JZYWVtiV0/mF4iW9pWiJeuy4SDcNBbzJlxBgvbRV5JljR0GU1h0lBnQdek31RPbiJZpUL/mcP1TlhR/V0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NdZOaGLN; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrHm6Ss7agoY8fS/wQl83yfoIwPso/mTa7fghXB0f/fh7YCw9iu3+PUi6Txa4tEkVs3lht/+Y8lqrywbo6HAK4fRBnP5jRXQr2ZfN5R90Q5BfX04+9/XUw89m1BxZdtrxmiV3l5RrHYRjSF9DKpYLDNbhLyLLq9w7t0sIUER8vOcIVhgOl7ZFzZIOqGg+irP1ghIUmLuhl1gS1PurpqrNZ4DMWvZGpiPVEd7dt0/D1wN8JbOvzic/w9CVfMY2b04e+dYO9J4VuOanMJQgWjpTBWHoTsMt29HgP9PiVLaCgsGILQgf19svRVyUQEbwq09StPb9wsEFXsuognL00M6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZOqbPi4Ayf9/UVAeP5TNgjuWVKpFh7XyyLhJX6aJMI=;
 b=GiNRbRMuNchwccJASuyKoqier405bdDxwuEh0cVzmEBzKBoNAOdPRy96LisGtW2/1vj1nOJTkQbiW4bpa8nTjsLzQqUn8U0mGLSmK8o8tlweZ8DFZ+zebFJ/j71NeXNTs67QCdpUGU/G4PHGJ9VnZdFkc8LYsipYVDek6pWXUL+4sJmV+XK+JsWOEqsQkpIT+wj3OWcAR8HS4XJ5JRfGAH11tgpAGEnPws3ytHpvDaXj7wOLsXbixgqDuleoPKZkdygwAaPbiTzstiqHEB9uhjF+qgbfVHAKfIM9eBCO58XHvD3UFyOOl1Nx4kEJtI6wOATihs16Bvmthgx6Ddj7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZOqbPi4Ayf9/UVAeP5TNgjuWVKpFh7XyyLhJX6aJMI=;
 b=NdZOaGLN8o0RF5j9rnvANy3NWCPQ7C/L+7J280eyCuiOo5sCqfxTvrdqJdMJub499qTStMrrQN1dqPI7jdU/YCd+0imo0yB8BsjgpAgZnxU/n3sIKam6gfWbTy4bt9STvGK+uQJ/5lWcqzhNhwdtyV+GHXDnTHoGXki8KHKDm7WCEXQkUwOZ3m4MNxeYGwX22fNMA3i6y0HjmUaZI+TJ/0tgRf6CX7XZfgoMkgze+qFNfwNmln3P6cGEGxZvS1ebDm2qyPEJugdwhm6gLCpEIr0Qi1wNr5D375l0+1RzMU9RUFMry0RTL4q885Ly7ejTMTYGatXt3n3grYt93xyDkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by GVXPR04MB10384.eurprd04.prod.outlook.com (2603:10a6:150:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 09:48:20 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:48:20 +0000
Date: Wed, 3 Dec 2025 11:48:15 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
 <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
 <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
X-ClientProxiedBy: AS4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::9) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|GVXPR04MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: d593f264-53d1-4706-c4e9-08de32511757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEhwdnlvYUh2NGcvM3hOWDg3SkVpN3hPSGUwaFNVb2hURHZ4L1FUdEFvbzBz?=
 =?utf-8?B?YkphYnF6cHBrY3ZoWlZ6UjN3R2ZtVjlFMExFWkVqY1Y5c3hITlFlcGZLemd2?=
 =?utf-8?B?THpscXVPUVMzcXBEWG93VHFPQ0laUUFmY0xOMDU1NUdFVU80UC9rbzlwNUs0?=
 =?utf-8?B?MVo4OEwxZnU1dXVVNXNHRVROLzRqSUxCc1NLRXRMQWd3MHh0ZWFnZ0hVNHUy?=
 =?utf-8?B?N2doQVBNS3p3REw5ekowQklpVmpuMitwWHdUQVd0bktXMmN4MXdsTDYvQzdG?=
 =?utf-8?B?a29sWVJUVDNleGdNWlo4SW1lNno1am9ORzdkWWN1Y3ZDb2ozVFhYT2ZlaDlV?=
 =?utf-8?B?V09UOENQSmlUMWFpdmEvWThnOXVKS2V4eVlYOVMzMGVkaUNZeEdFK2pIUDFs?=
 =?utf-8?B?eW1MQm5VNEQvMlNpNENhdUROMTVLaGZIRDBSM20rdHQwMEtOeURvRDdWWDlH?=
 =?utf-8?B?ck9YbW5KTnpnSk1aWldiQ3Ztc0NMY29zenpHMGlteDdiOXRaZldaT2doL3pG?=
 =?utf-8?B?eVdhM25CZVMyWFk3T0UvOElvMDN1QWVrR3kwTC91bkgwZVR4ZEJneHcyZFZI?=
 =?utf-8?B?WFM2Rkg0Y3hBZlk0TG51MUFXYjRnNWxWTDAzRDhaQ1hqYnUva0xZL2d2VWxH?=
 =?utf-8?B?eDlacUxhVmkyeW1OQnh6b1ozODdEbUFrSU5reDZyelhyMVRxZjlSK3lEUnFZ?=
 =?utf-8?B?MGlhU1hNcEREUzgxTCt6ZE5GOUZvbVprUzZ0bURLNXFDODY4MUplbjExeW5J?=
 =?utf-8?B?NWNYMlVXdmp0WFFVODd4d244V1R1SjYyUzhocXlid2NBeWNCb0N0SVhvenVR?=
 =?utf-8?B?NERiNDRtcXpaZ2JIYmF3U2prZEZUZlcwd1orSC9YS0JMN0hHbGg3VzRRbXdC?=
 =?utf-8?B?R0xkQ2pLVSs5N2FnUkREb0oxMzNmV1FmVitzaXRtNkdBdE0vN1NwdHNrVVYr?=
 =?utf-8?B?dXE3NHhHWXlTL3VYcW56QzBKZDloZHA2aE1OZG9EYkovWHpEejBXYm81Qytl?=
 =?utf-8?B?dkI1RnhZaU5nTlF5UldlMGhhamNBZlY0N0R3T2lRTURKWUEzMzA4WmJBZXZL?=
 =?utf-8?B?dWJhTlUyRzRLTGVuejRhTG00SXNoVDdzWno0ekpZUnNhQUc5VWFLY3o3VnI5?=
 =?utf-8?B?U1I0K0pJNFRORkgvdGpvS1QwdStwd242bmJ6T0diNGxMeDlEbURnYVpUN3J3?=
 =?utf-8?B?V3ZvNzcvUWhKbW93N0NkSHYrMXFqRGpKeS9uNTkvK1pBajdTNXJuVmVHVXZX?=
 =?utf-8?B?R1FoejNoU28zanE4UXk4NU8wZDRJbGVvVnpMdEVSRGJyMEEwQklTZW9kcXF2?=
 =?utf-8?B?TFdDYlVMUms1b3VRTVd5d3o3S3ZhZzlIeDBWRFdMei92OWFtR05WdWVIVEFT?=
 =?utf-8?B?bThaRWc3bkhuVnYrUGxVVjE4Y3V1VVVEWkI5dy9od3h1N3d1UnBxdjBGcm1m?=
 =?utf-8?B?c3JtdEVYZWdSd2NpQzk4cC9aLzdiV1d4VlBhMU1sanhIa0VXQStGUWF0Vk0v?=
 =?utf-8?B?UkRRV3FTclVRTW9EMlduM1ViN1YyRDFKbldvWHptNWExNnlFWWZ3Yjdra2tN?=
 =?utf-8?B?dXdrUFZxMnZrOFdYWE1ZUlBJSTZFNmJjd3RVUGxkMjVlSEhGWTQwS0UyY1hM?=
 =?utf-8?B?TFJ6dVZ2YnVFM0RHRHR1dWFmSHhPcDRRbmlGb2pweG4ycVlFK1lTRU5xNFlU?=
 =?utf-8?B?cXEwby9LQnpueWlhWHd3ZzZ1c0xoaDVvTzgzbTJqdG54R1ArNGhSTDU0Z3Fz?=
 =?utf-8?B?RjJuLzh4NEZyWFE3VFptajBVQXMwQ1lHaG1XT2NJRjgvbElNRU9TNjBGeFZM?=
 =?utf-8?B?NVVDdjgvRDRvUThtUGQ2WGxCZzEyMkhWa29RZXkra0N1SllUamVSU1kzOUJW?=
 =?utf-8?B?aU1lUkU5VmEyS0duWU9JYjVuL3VXUWR3b0htRFlQelZ2UzNoWEcxM0h0eHlS?=
 =?utf-8?B?RUg0cllUQldtQ3FzUzZFVWhlVDNUU1UyRDUycS9ad1ZnUi9xNHp5VjNJUHNT?=
 =?utf-8?B?OUZ1K1VqcHF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU9OOHgzRmxQb0JoVzdQREo5SGRtbHFid3VoQ0VoeWI5WkxjNEtXTDJQRzFR?=
 =?utf-8?B?OHZwYmFNd3dYaFhKVUZBc1NpTHgxMGRUOEo5QWF6eGhVbTR5WHp6R2tWemU5?=
 =?utf-8?B?dmhoelJoNlVRRGgvVmJGVXFGQjBQbWJ0M0RMenFxZEJWNkNqeHZMS2dRSWJw?=
 =?utf-8?B?aDBDZzRWOVozVmw2SnFQTkw1akFwaHM5ZjJZWlRCRmJRY1dsNkZOTlFPcFlE?=
 =?utf-8?B?VHVsd2orRk0xdjZGdEZ4bGErTm1NZEpLdGVzdG9DM0tqRjd3MStEdGVqQ1Nr?=
 =?utf-8?B?SmtoVThhYUhEN01GYVJSQTMwQndnMUtGa1UzaVdzQWJvbGZtWkhuditnbm5j?=
 =?utf-8?B?bnVTOStPazN6cTNVVTIwOWw3UklvTUcwL0JKMG16aW45MXI0TzVUN3pKMDFz?=
 =?utf-8?B?amc2L0JBM0NrUVNocTNlVzRPL3hqQTdISkc5VGhpcGl1bnhZODRxR0pDU21S?=
 =?utf-8?B?bXRINkFaL3V1VWc2SnBDb1FvY0JFdDN2WTltMDdtQlFTRVhRQ00rNkRhaHNu?=
 =?utf-8?B?U01ENEhwWHFmRlBlcEorTnE5QVhyWFo0Y0FVWlVnZFI0OEdFVW5SRTQyWFUy?=
 =?utf-8?B?MmhzRWkyZjNmR3l6YkZHaDlrNVdzaUllQ2czK05iMDlaNmVhQ2lmS0hLazBU?=
 =?utf-8?B?V3FiVE1rcUxjVWV4TW84S0dMNWZ0eTBCV0RuZEJKdWRnMFdCSnR4Sm1LRjgx?=
 =?utf-8?B?OTJvc2crN1Q2a1VnWGJmOWwrN29BSjZkRmgyYXR3QmdNQlphNGV5L2docDFL?=
 =?utf-8?B?MjR0dVJ0NFBkUlllem51bWZUc0tJbW9Kb2xqaTJCejh1eVA0bUkvTVJhSmM3?=
 =?utf-8?B?d1lHVzVkWjliRjBvaXl0WENGNlVOSEFWbXB5eHprVjQ4d2ZaeEdyNFdjeEla?=
 =?utf-8?B?TUM1WHZDZHRVUUdDbDRyUDZ3UjhCWHlSWjZtSm5pVUptVmR3SzFlb092WEdY?=
 =?utf-8?B?M0JsbzJwMGVOeTRUaGh5OEFEL2MvMEtKR01yRG1SMzh1bmhRR1BIN1h1Q09h?=
 =?utf-8?B?NXRYT1lTU0o2T0FtdjliTE1DV2VqNVcydlNjQ3dXOHhWQ3o2TDViaXhQcVFn?=
 =?utf-8?B?V0xXaEZNMndueGJPUm1Dc0tRQVJsbWMyZnV5emNJYzNRbUxkdWl5bDlsWDhM?=
 =?utf-8?B?ZkVGNE53NGV3aVcwYjgzZ1lLMXFoZGx5c093c2hPc0hVVm1ZZmdEOXZ1UlJ3?=
 =?utf-8?B?TlRabkdYMEV4Zi9lRU1CdHEzWnh0T0c1c2MvUkVWQllmTytid1ZpdVFGRkJ1?=
 =?utf-8?B?L1JteUFpM3M3b0dvMVArSWFPT3ljT2ZxRTUyVXN5SFJpRWFpZEEzQlgrbWho?=
 =?utf-8?B?Um9JNGczQUxELzhVd0JMNWVvV0VNQldnK3BadmJlNndWU05xT1g5a1ZlM2ho?=
 =?utf-8?B?UVowR3YrV1VUbzlxQ1lPQU4yajM3SVVVbmJqamZ4TW5UOGoveHc4UDU1MjVs?=
 =?utf-8?B?Y2JWa1pzdHV1ODFUQzNMV1dwcFRubVQxNEs2dWNZYXZlQ3JaRUpJeE9yQVVo?=
 =?utf-8?B?SkJSTXF6Mi96ajRaT3ZZY2puc0V3STJHalFpTUpXZjdQZXVMTkhNQk9kendu?=
 =?utf-8?B?Tm9xUmF6cE5xMXh5dUJ3MGpuM3NIdFcvMCtjQWt0SWpxalZHeWFveHlyRWtQ?=
 =?utf-8?B?cEVTMnpOSmFrYmVQN0dtS3NObjRUMmJDVnQvaS95ZFYvWjc2R21Va0tSZndj?=
 =?utf-8?B?dTk2dUcrSHc2WXRJdW1mNmhvK3FUKzdvNDBlNmtnNitwUmF0ODliYU9lRk1r?=
 =?utf-8?B?WlhKWGFOSURrQnAzc0pQV09WOEFFK0FleFBqcFRxckc3NGQwbWNORkRPN3Zr?=
 =?utf-8?B?ZUdNdGlNcnJySXQyYzBrdzJPK1pwRm5aZmk5WGNwQkdoTFM0cUFtOUxXMTdF?=
 =?utf-8?B?TzJ0d3FFdWZnbUh1c2tYSFlHV0RWRDdObG83SFI2NHd6eW9IWGRJM2tWZ1hJ?=
 =?utf-8?B?ZFFab0xMTlEyU0R1c1NMR1hpbHhNVEpGckdPeWNtaS9vWk5ONlJCL0NLTkI5?=
 =?utf-8?B?L1liOGNXcXVGNGxmUEJCeTB2Qy9RbGJYNGVCRDVvSmE1RGNkT0hTblNCME9I?=
 =?utf-8?B?YkQ4dnV5Q0ZaYzhFUCtQS3hPUnlhNW1kbzNNNS9YWVBiLy9nSWhtYXU2Q1JB?=
 =?utf-8?Q?zNfD6ozbtM6sROiF0KluBkEZ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d593f264-53d1-4706-c4e9-08de32511757
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:48:20.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QZoMy9W6smFvWcGB5MSpFllyY6EfLtmQcp3OkH7w02L+xZM/T0zNT/qKaUpqw1Xf6WD+rL3ov+7Z/AegI0eZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10384

On Tue, Dec 02, 2025 at 03:19:17PM -0600, Rob Herring wrote:
> On Tue, Dec 2, 2025 at 10:36 AM Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> >
> > On Mon, Dec 01, 2025 at 06:09:19AM -0600, Rob Herring wrote:
> > > On Fri, Nov 28, 2025 at 10:43 AM Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> > > >
> > > > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> > > > > The Devicetree Specification states:
> > > > >
> > > > >     The root of the interrupt tree is determined when traversal of the
> > > > >     interrupt tree reaches an interrupt controller node without an
> > > > >     interrupts property and thus no explicit interrupt parent.
> > > > >
> > > > > However, of_irq_init() gratuitously assumes that a node without
> > > > > interrupts has an actual interrupt parent if it finds an
> > > > > interrupt-parent property higher up in the device tree.  Hence when such
> > > > > a property is present (e.g. in the root node), the root interrupt
> > > > > controller may not be detected as such, causing a panic:
> > > > >
> > > > >     OF: of_irq_init: children remain, but no parents
> > > > >     Kernel panic - not syncing: No interrupt controller found.
> > > > >
> > > > > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> > > > > parent") already fixed a first part, by checking for the presence of an
> > > > > interrupts-extended property.  Fix the second part by only calling
> > > > > of_irq_find_parent() when an interrupts property is present.
> > > > >
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > v2:
> > > > >   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
> > > > >     controller handling"[1] to relax dependencies,
> > > > >   - Drop RFC.
> > > > >
> > > > > [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> > > > > ---
> > > > >  drivers/of/irq.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > > > > index b174ec29648955c6..5cb1ca89c1d8725d 100644
> > > > > --- a/drivers/of/irq.c
> > > > > +++ b/drivers/of/irq.c
> > > > > @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
> > > > >                * are the same distance away from the root irq controller.
> > > > >                */
> > > > >               desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> > > > > -             if (!desc->interrupt_parent)
> > > > > +             if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
> > > > >                       desc->interrupt_parent = of_irq_find_parent(np);
> > > > >               if (desc->interrupt_parent == np) {
> > > > >                       of_node_put(desc->interrupt_parent);
> > > > > --
> > > > > 2.43.0
> > > > >
> > > > >
> > > >
> > > > This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handle
> > > > explicit interrupt parent") does not help with the issue.
> > > >
> > > > This is how the DT node in lx2160a.dtsi looks like:
> > >
> > > ls-extirq strikes again!
> > >
> > > I think something like this should fix it:
> > >
> > > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > > index 2271110b5f7c..c06c74aef801 100644
> > > --- a/drivers/of/irq.c
> > > +++ b/drivers/of/irq.c
> > > @@ -593,7 +593,8 @@ void __init of_irq_init(const struct of_device_id *matches)
> > >                  * are the same distance away from the root irq controller.
> > >                  */
> > >                 desc->interrupt_parent = of_parse_phandle(np,
> > > "interrupts-extended", 0);
> > > -               if (!desc->interrupt_parent && of_property_present(np,
> > > "interrupts"))
> > > +               if (!desc->interrupt_parent &&
> > > +                   (of_property_present(np, "interrupts") ||
> > > of_property_present(np, "interrupt-map"))
> > >                         desc->interrupt_parent = of_irq_find_parent(np);
> > >                 else if (!desc->interrupt_parent)
> > >                         desc->interrupt_parent = of_parse_phandle(np,
> > > "interrupt-parent", 0);
> > >
> > >
> > > But really, at some point it should be converted to a proper driver as
> > > there's no reason extirq needs to be initialized early.
> > >
> >
> > I just tried converting ls-extirq to a proper platform driver and it's
> > pretty straightforward. The problem is getting that driver to probe on
> > the ls-extirq dt node since of_platform_populate() is not called on its
> > parent node.
> >
> > I would avoid changing the DT and adding a "simple-bus" compatible to
> > the parent nodes. The other option is to add another simple driver which
> > just calls of_platform_populate() for all compatible strings defined in
> > fsl,layerscape-scfg.yaml.
> 
> The simplest solution might be adding 'syscon' to the default match
> list for of_platform_populate(). That's kind of a big hammer though
> and could break something. Not sure, but I'm willing to stick that in
> linux-next and see.
> 
> Another option is hijack the simple-pm-bus driver which already does
> just what you said.
>

I would prefer the second option since that doesn't impact other
platforms.

Geert, since you are the module author, are you ok with the following
diff?

--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -142,6 +142,12 @@ static const struct of_device_id simple_pm_bus_of_match[] = {
        { .compatible = "simple-mfd",   .data = ONLY_BUS },
        { .compatible = "isa",          .data = ONLY_BUS },
        { .compatible = "arm,amba-bus", .data = ONLY_BUS },
+       { .compatible = "fsl,ls1021a-scfg", },
+       { .compatible = "fsl,ls1043a-scfg", },
+       { .compatible = "fsl,ls1046a-scfg", },
+       { .compatible = "fsl,ls1088a-isc", },
+       { .compatible = "fsl,ls2080a-isc", },
+       { .compatible = "fsl,lx2160a-isc", },
        { /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);


Regards,
Ioana

