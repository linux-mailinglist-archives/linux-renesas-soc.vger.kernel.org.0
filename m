Return-Path: <linux-renesas-soc+bounces-27934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH7dDxFMhGm82QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 08:51:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B7EF9AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 08:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 901B93006990
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 07:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA1935FF5B;
	Thu,  5 Feb 2026 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NHTS1dal"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA8D35F8C5;
	Thu,  5 Feb 2026 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770277898; cv=fail; b=Lxcfc0Sp97DJOsrftJ8Wc5IFXdo4urE9lKbG43PLuziNWJ2OZZmR/IXdpNw0/ALfCz4/vbNkLCgzTaS/tIYf/xs/y34/3XOi1AmNHHPcfLqcVrygHVsW7N5TbqQoF1wiNAuT1ZVj3GaA5pKDQm17nSFatDAnejU3pmSQTDylFD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770277898; c=relaxed/simple;
	bh=fyGbYhMsJ18VQnRtKJYco+sZ82CkSgZsMCq1SG1p+6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PNC9TwiYFQFKWp33yOTMsb7ecZsDOMYEmxx1eB+x3R7Rp6gZY6cwL8mPp+5DUoFk2z+y/3WfEU1K6FhA0AXIc2wuPJ+RTV+YOxuPwsJNjLLfsnV17x7lva/roqujdzqTwQenMcWyAofbEIDnpRtHXhTaiEbSptO3k1R6u+PceOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NHTS1dal; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SosGs6QnRBi1jOZpzDHkXflhsEfiGdmcwbBFHcUGEDEp+dqud+qPj5q4GSC5kVZRB7Ha0VtIGgU7mA0OV2lvrHV5SjSiJmh9qCO82nW3sz70kj5c4yxx2ATmMPGudb7Jbc4L4YXX7JqCf3ZH9FgP088zVPYdB8CBH7djmHlovIVV8YFNa0VgocCJFdlhZq4YAyVpumiRMXm8JdtrTshK9Qo0M1HqqRThV10rg4jO1d/yAO+DPvoJeGa9HUvb9dQWfw4ITEHryy8jzI8BHybNTcoHJMvXGnXz8gHk+N6Pc8RStd9b8iwIiSYBg1EFvXqhxOou8DQjnvZjtJlSqUmEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyGbYhMsJ18VQnRtKJYco+sZ82CkSgZsMCq1SG1p+6k=;
 b=QuVSW6P5dzScJcKEQP6qUo/itkH4aPU0PoNyc6xijitU0yNYvSF+M/u8aw4sv/amQG6xI/mZRFhglBlHDEytTy8lYfJqea6+kyfzsgSNh7xG6dbBgVdVMkzXGMXGqQpojWzMI/3d+Mwah5zsHtU3dNi8iZxkzXOr5jM+S2g2ik8ZphmW/P6ewhmTz6nKP8y3m8OrxsSZglH6m4CK6Q/U3Cq+A5cOv0TXhFSABXrutQ8GKguf/SmNCmmOMHCY8EFW4LL633Kl23k0tAjqV/hU1A/31LFQHdCQ2yrNkEJ9f8yNv43wePCoBdX4vIcj2gS3q2CV/Xeq5k+d0q5kH8QSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyGbYhMsJ18VQnRtKJYco+sZ82CkSgZsMCq1SG1p+6k=;
 b=NHTS1dalfcV11vWKZd2fDxwUOFe35y6AZT3jqA7T3EkuKBS6Z3zkpOQD2NpHNEXlDlKYcrO067ikqq5fZCpc/VRI1NTjzUxU9PABrLENkxpmNK1JqFS9x21sfwK5wWM6XnveYXgnDCA7yZjytpGh+spV8Vh4rGy4TpYjj+nihD0=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS3PR01MB8796.jpnprd01.prod.outlook.com (2603:1096:604:17e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 07:51:34 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 07:51:33 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Topic: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Thread-Index: AQHclm8qD3lunnbaf0uAuh27IRHtALVzunqAgAAAwJA=
Date: Thu, 5 Feb 2026 07:51:33 +0000
Message-ID:
 <TY4PR01MB142828D6A83F85B08D85D3EB98299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References:
 <20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com>
 <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
In-Reply-To: <3b1405cd-6c7f-4883-95fb-151cab223a68@cogentembedded.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS3PR01MB8796:EE_
x-ms-office365-filtering-correlation-id: 73c3e164-0304-468c-02e9-08de648b61e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHQ2VXMxdHpWQWMzb1EwS3dsVlptRGcxZ1Bld3hHMUlIMEoyc2RlM21tRjEw?=
 =?utf-8?B?elFLTFA2YmRPc2hTYkRBcFYzeG5kVVAwVkhZWXJleVJLYnkralJtYW5Ea05R?=
 =?utf-8?B?Y1c1ZVdhN1h3bHNrL21QeUhYZjIzaXpKeE15b1cvNEZNSUw3am1NV0piTnhI?=
 =?utf-8?B?QVFmaVQ1UHZmb0tBMncwd21pdXZ2RlpYZ1h6MkVVUWk2elBNeitHOWFoWmox?=
 =?utf-8?B?bEs0SmdEbGhxZHE3YnVKTDVkL2lpTXFnOUR3TSthWlFYNVZ4TXRSK05wQnF2?=
 =?utf-8?B?LzN0MTVvQlozenp1V2ZZVDRiVnRTdTlKK24zKzRrbE4wbnFIbjZrQkNQek5t?=
 =?utf-8?B?YU9aRWp3bnlQL1dCa1VKbm5naHJrQjlDRHVZTnluU01IQmdZQ3FBMENvbnBU?=
 =?utf-8?B?WmttSWR2RVJDalZFSEIwb25WMG5LQkthRFRCeFRyOVZwUldTSWR4dmE0RnZt?=
 =?utf-8?B?dVdOMDdNb2NUS0RIRk5XZjJ1RVNYd1c2VlpLVnBiUFpyaXhvMFlNSTNia3Np?=
 =?utf-8?B?VVZhTFpNMnhLRkxLcFJTRHZZTllMUkZnUmdzWGtKREk3dUViUUt0R3AwZHVV?=
 =?utf-8?B?WEpQMXo5aWVzblV4V3lRcE5kbDFtMkdvUFlMdEc0N0loRVRxVXMvTXdCUG9s?=
 =?utf-8?B?U01qT0p2bWZYaE5pUEZ4bjRvUkk4NEltU0tCdWNJVURlaldwWVNlNnhTMldO?=
 =?utf-8?B?Y0V1M3NZNXFPTTh2b3p3NUJ0QlJ0cW1vREhkYUZDUDFwSnNiWEF5NkxxSlF4?=
 =?utf-8?B?WmZoK2dtd3lPSEFkTlkyT2ZGRGdSdmwzam4vRDRkQStLcjAvSXAvTDhESVZQ?=
 =?utf-8?B?TjlUekVucUhVTmlkdzl0RUNOb0tuQitSTnpQRXMxdkdxUGxEWHRhQU8rUnF2?=
 =?utf-8?B?K1JWZEFCSWg4TU9BWWs4ZGtFTTZpaDEyT2dnQm1qVnFDQWtoSjJhdVh3eGM3?=
 =?utf-8?B?Uzd2STNQZGhQcm9UTEtDZ05LMGFGRlRJRVQvOHpGaVA5STUySGRjaWJTa1Ba?=
 =?utf-8?B?L2p4Z2RReHYvcXdVTi8vMDZYMXB4MTFCMW1GdnlSOUZ0allqN1FBaklRYnRu?=
 =?utf-8?B?bkZFdEpIRE9TVGVCQk9oVWM5Z2FSY3I3RVM1U2FuZW0xUXE0SXV0WjBkT2J6?=
 =?utf-8?B?Nng1MXBXOWdEd3Vwc2MzbDZWdGducWZpV0lHa3ZQQVdOaXRjUlc3dTZUWXpR?=
 =?utf-8?B?ekhWQjFwbVgzaStKMC84MFF3NzVscW9EQ1Z5WTg3WExnYmpIZ3lSNXB4bGRm?=
 =?utf-8?B?aEFNS1BiZzJ6cThaNkFqS1BTMkJUQWh1cDlpMGcwV0NBZ3JRdjhVYTZqU0Fj?=
 =?utf-8?B?bGhBR2tBSlhZakwvakd0S2NKcThMWUwwRU11aEVqT1ZUOFBtQkR1eE5EajBh?=
 =?utf-8?B?Y1IyaEVsSzlUcUIxRHFxR0d0VVpDL3pxUitnQnlXak5nVy9iYU1hMlkrVHVS?=
 =?utf-8?B?Q3lJQVVJYXFtT2E5T01sZ244eUFRbUFRL29MQzZMQjlBN3M0RXpTVlBYOU12?=
 =?utf-8?B?ZUVsWnBiV1VSS3E0dlJia2pWZjI2VXoxMDExSWxOcUZIWTJnVmpmaWgyWGN1?=
 =?utf-8?B?RmdabVhNSzNLMzEyWnlycHlwQ2h0ZVN4ZklaVERrZU9RYjF1Njg0aW1kd0c1?=
 =?utf-8?B?VVUydlRBeld3OFVKVlVjYkFXOHkxYm8wMjFDUzdpbG9RZWlrWXVoVTE4cEQ0?=
 =?utf-8?B?WnJyZWN1dkE1TWowSlpoejRDU2srbVNNaUZIQzU5VVlYWlF4dTk4SCszTjU0?=
 =?utf-8?B?V2hBa2RnQU1yQnBRSmx1K1lQbkYvdy9pakwwcG1GY1E2MUM1bUlGdzJLU1dR?=
 =?utf-8?B?NFdwbG5XeWVQT0dCbDA0Z3hvNDBjZVY2UW5icFc5d3dlc2J4Sm9hcjl6RXh2?=
 =?utf-8?B?VGNFdXpJTnU4Tnhub0tRV0pMVzV3WUxMLzlramNUQkVUWUdrYldUN1dMSVRN?=
 =?utf-8?B?Ky9BcFVTbU13UWN6K3JDcjRrZG00bXcwb3BadThXS0oyb3Nmemp0TE1rZkFB?=
 =?utf-8?B?SmtUZWU4MkkybytCZmlaTTFRV0xpeFBVd3h1aEg2NmdpdHVwWUV1K1l5NmM5?=
 =?utf-8?B?bDNsMU51M2FmSmw5Z3FiMDhKRk01NXYrZjYrMlJ0MGlXaElOMjh6dk0yNWZH?=
 =?utf-8?B?YTN1TW5seVJQMXVpQ1p1RW9QNUEvS1p6ZzQ4My85Y2oxQnBRUzd2L1NJZ3Zp?=
 =?utf-8?Q?PrHnAOdfFcgiQFGJdI7QzCM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WisreTk0ZlcreFo3Y3VoVVFuUGlVUTRQN3lwMVp0UjZhMTJKck1ScnYvQklv?=
 =?utf-8?B?VmJCMGEvUC9HUStFMy9vano2UHNnNG9zMHpSb2FOTlZVdmpZTnlaTTlzOGFS?=
 =?utf-8?B?WWREbGVadTJLVXhQMFZ1QjBGMmM5NytzbTRhOW05SXk0YWx5cjc3M1E3UEV5?=
 =?utf-8?B?SEdsa3E5YWRLTDdheFAvM2VNNWFEWUJJbll0NWYxY0VWTmE2YWIvMmZwZEx3?=
 =?utf-8?B?Tk9tQUFLRkNRbXowdDBwL3ZpRUdBaEFZOTl4UTRqTXdjNWhCeGdMMmJsTGFD?=
 =?utf-8?B?TWFYeDBiM2VDQzREQkVDRkdvVjlTQ2JYcld1TkFLMXhCNzAreElBbnVmcHdi?=
 =?utf-8?B?UkhabnNJR2ZrMmdsRGtUM0MrT1g3dHVNNi8zQlE5aFZNSXk1TVJQNEZ5Y3pI?=
 =?utf-8?B?enRRQ0ZUNkJoUmRJRTFPMmQxWk1SQTVWVnltL3dGZVlwOVc0b2FBN2hML2pl?=
 =?utf-8?B?Y0hvYm1HNFAzaHY0R0pSbHl1V0l0MXhnUHFYbUdua2hWSTU0OWJqOXJJQ1FT?=
 =?utf-8?B?QzFWTEVrenVzcE9YbGNkUERhNkJ6Vmx2ckxKTzA4TVVWdk9lYlN5bXVLMGVq?=
 =?utf-8?B?N1dJanB5R1JiM3laY2NYczZGQ05iY1g0Z3puQXFsblVZK2NZYTB4TnFsbnhz?=
 =?utf-8?B?TmUzUk53OVlBZ05zZUMwQ29FR2xnWFJPaUdZaDVFd2RITWFTVHZyTWpobUxi?=
 =?utf-8?B?MnNHaDJFL1dSd3c3V3RDcWp5bldlcERDeithZUZCS3FHZ1k5U3dBdmFNVjlD?=
 =?utf-8?B?SEQ4ZThrTjBMV2NyaGtpdXZiYng2T0dlZmVwZWQzQTA1NFdsb0JnOVMrMjRO?=
 =?utf-8?B?Vm5LTzNNcDBhS0NNZ0NOL2ZNQ1l2Vm12L0p6dE83OWp2akZESnJZQ2xEdHZx?=
 =?utf-8?B?Y0RETTdBSEdDUExVVzRhL1pyWWRWOGpiL0ltK2ZTVGp6NjA0N1ZMMGJVQXc1?=
 =?utf-8?B?M2dLNlBaWU9iVnc2elQvbExrUGl4czZhZTU4OS9KRkJaZWh1TnN4ZTZidXJi?=
 =?utf-8?B?Y25wVGxSc0VGZVI4SFpXL0d5d0s2aWJmL0V1Um5ybDNPb1VPWks4T3hoVGtB?=
 =?utf-8?B?L09rc1hLVFUzdWlzMWZCVThudDN1bzFUUzZNSkJGRG53b08zSit6YVRERFcr?=
 =?utf-8?B?WmNVdU45ODkyVVNOSDBXR3c2QjVxYnJJWEhTMVVsZVVHZGxTNFh2aUl5UG1X?=
 =?utf-8?B?dEZXeExpSWtmOUdlV0FFbEF3NU9oT3QwM2FMc3pUMUZNYWNNTkxwTWRFUDRn?=
 =?utf-8?B?SVhjSkxyUjM1c3F0NUZwTHZVVHRIeE5EQ3JjaUxWOTRINE5IS0I1cEhpMEFS?=
 =?utf-8?B?Smk3S2plNHN5dks3d2VFY09qT2YwWEN4OTdoZm50b0JERkMxaG1maFNROXZZ?=
 =?utf-8?B?NGFEcUtJUUF1UVRMMDlzQ3gwb1ZyQndmN0ZwRHpMcnNIOFR4SVFWN1dTSVlh?=
 =?utf-8?B?ZjJ5ZWppYTZtWXE0VEZVSURVWUx4QlNMVWg0TFNJVnpFS0sxekg4Qm82ZWRp?=
 =?utf-8?B?MmRUOEpoWnVENzRadzU1eWE2cXNkRE5NNzJYbm1ZNTJhNnppNmlMazZMbkNW?=
 =?utf-8?B?S1orbVZXbjBwVzZmRjZJcWpTSFMzcDJWMTRWN3lrRmJBcXNhSHcvdDVxd3Ix?=
 =?utf-8?B?Q1dHbVVXazdhQnJOSXN0TjZacEpxNnJ5NzZXVG1PbWlGRXJ3VVdDbU0yUWc0?=
 =?utf-8?B?YXNudHR1N2lhaXZxekd6dzNXVkdrVG5qZWJTaTdNaGxTL1JwNUtDWkMvb0Rk?=
 =?utf-8?B?YjIvaTZuT0llWHd6OUFMYjM3dTMvUi9RN3dPOHd4TlNSazVPa2MwOWhscDlD?=
 =?utf-8?B?YmtIdGM0aWtjdno1N1R2SGtPLzduZ2FwOFR4eUhoMGRBRThGY0xvQ2FqMmF6?=
 =?utf-8?B?YUo3eTgvaURKRjAzNGM0SXVYUksrRzZ5bkNEU2lzeWxmSDFPc0JFZC9oZktT?=
 =?utf-8?B?YktNV3gra1dVYjhGOHhhWVI4alhvMkpVd044VSt2d1ZkWWREWjNoN3hVeGEr?=
 =?utf-8?B?TXlUSTJuZnNUcGNnOEJ1c0xUc25FR2hHdjM2RWtHMWk2QmlLTzJwZ1FQSElV?=
 =?utf-8?B?RU1Jb1pQY3dxM2VzdkNtQlpjSmZSK0d2c3FBUTI2aU90ejVUZ2xhSGw2bW1l?=
 =?utf-8?B?d0kvZnVhV1BKcnBDSVgyTFM1SDVKT2xBaklhVkJOSy9xSGIweGZqV3c3SWsw?=
 =?utf-8?B?SzBhSHNSQXBhRlVaOXFEaHZxR0JhZ3ByWEhES09pZ2E2VitLOUM5WjhDK1pa?=
 =?utf-8?B?NDhKWDFtZXNLYlNaMUZXTVNTODRxRlhva0dFWUdyNk9vNkdWK1VpclpFUy9S?=
 =?utf-8?B?aHVmSm01K2lNL3gvTmpmRFVTbC9TQUM5NWFCMTNwNHpHQjRCOUwrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c3e164-0304-468c-02e9-08de648b61e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 07:51:33.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vy8c3VhDiNfmhlTs/THfA5beUcjZqOLA6zFNlQ32e2n2SkJqgMcxYK/tDkVK9ItlC+Po0exOfJJTVgJvI6ldmPu32peZdPIAt+U1ZrSaUNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8796
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-27934-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,davemloft.net:email,cogentembedded.com:email]
X-Rspamd-Queue-Id: 5C3B7EF9AF
X-Rspamd-Action: no action

SGVsbG8gTmlraXRhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5p
a2l0YSBZdXNoY2hlbmtvIDxuaWtpdGEueW91c2hAY29nZW50ZW1iZWRkZWQuY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgRmVicnVhcnkgNSwgMjAyNiA4OjQ3IEFNDQo+IFRvOiBNaWNoYWVsIERlZ2Ug
PG1pY2hhZWwuZGVnZUByZW5lc2FzLmNvbT47IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8u
c2hpbW9kYS51aEByZW5lc2FzLmNvbT47DQo+IEFuZHJldyBMdW5uIDxhbmRyZXcrbmV0ZGV2QGx1
bm4uY2g+OyBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+OyBFcmljIER1bWF6
ZXQNCj4gPGVkdW1hemV0QGdvb2dsZS5jb20+OyBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwu
b3JnPjsgUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBDYzogbmV0ZGV2QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0XSBuZXQ6IHJlbmVz
YXM6IHJzd2l0Y2g6IGZpeCBmb3J3YXJkaW5nIG9mZmxvYWQgc3RhdGVtYWNoaW5lDQo+IA0KPiBI
ZWxsbyBNaWNoYWVsDQo+IA0KPiA+IC0JCX0gZWxzZSBpZiAocmRldi0+Zm9yd2FyZGluZ19vZmZs
b2FkZWQpIHsNCj4gPiArCQl9IGVsc2UgaWYgKHJkZXYtPmZvcndhcmRpbmdfb2ZmbG9hZGVkICYm
DQo+ID4gKwkJCSAgICFyZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3RlZCkgew0KPiA+ICAgCQkJcnN3
aXRjaF9jaGFuZ2VfbDJfaHdfb2ZmbG9hZGluZyhyZGV2LCBmYWxzZSwgZmFsc2UpOw0KPiA+ICAg
CQl9DQo+IA0KPiBBbHRob3VnaCBpbmRlZWQgdGhlIGNvbmRpdGlvbiBpbiB0aGUgY3VycmVudCBj
b2RlIGlzIG5vdCBjb3JyZWN0LCBJJ20gbm90IHN1cmUgY29tZm9ydGFibGUgd2l0aCB0aGlzDQo+
IGZpeC4NCj4gDQo+IEZ1bGwgY29uZGl0aW9uIGZvciBhIHBvcnQgdG8gYmUgYSB2YWxpZCBjYW5k
aWRhdGUgZm9yIGhhcmR3YXJlIGZvcndhcmRpbmcgaXMNCj4gDQo+ICAgIHJkZXZfZm9yX2wyX29m
ZmxvYWQoKSAmJiByZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3RlZA0KPiANCj4gSXQgaXMgbm90IG9i
dmlvdXMgaWYgYXQgdGhpcyBwb2ludCByZGV2X2Zvcl9sMl9vZmZsb2FkKCkgY291bGQgZ2V0IGNo
YW5nZWQgZnJvbSB0aGUgbGFzdCBjYWxsIHRvDQo+IHJzd2l0Y2hfY2hhbmdlX2wyX2h3X29mZmxv
YWRpbmcoKSwgc28gdXNpbmcgb25seSB0aGUgcGFydGlhbCBjb25kaXRpb24gYXQgdGhpcyBwb2lu
dCBkb2VzIG5vdCBsb29rDQo+IGdvb2QgZm9yIG1lLg0KPiANCj4gSSdkIHN1Z2dlc3QgdG8gZWl0
aGVyIGNoYW5nZSB0byBzb21ldGhpbmcgbGlrZQ0KPiANCj4gaWYgKHJkZXZfZm9yX2wyX29mZmxv
YWQoKSAmJiByZGV2LT5mb3J3YXJkaW5nX3JlcXVlc3RlZCAmJiAhcmRldi0+Zm9yd2FyZGluZ19v
ZmZsb2FkZWQpDQo+IAlyc3dpdGNoX2NoYW5nZV9sMl9od19vZmZsb2FkaW5nKHJkZXYsIHRydWUs
IGZhbHNlKTsgaWYgKCEocmRldl9mb3JfbDJfb2ZmbG9hZCgpICYmIHJkZXYtDQo+ID5mb3J3YXJk
aW5nX3JlcXVlc3RlZCkgJiYgcmRldi0+Zm9yd2FyZGluZ19vZmZsb2FkZWQpDQo+IAlyc3dpdGNo
X2NoYW5nZV9sMl9od19vZmZsb2FkaW5nKHJkZXYsIGZhbHNlLCBmYWxzZSk7DQo+IA0KPiBPciBt
YXliZSBqdXN0DQo+IA0KPiBpZiAocmRldl9mb3JfbDJfb2ZmbG9hZCgpICYmIHJkZXYtPmZvcndh
cmRpbmdfcmVxdWVzdGVkKQ0KPiAJcnN3aXRjaF9jaGFuZ2VfbDJfaHdfb2ZmbG9hZGluZyhyZGV2
LCB0cnVlLCBmYWxzZSk7IGVsc2UNCj4gCXJzd2l0Y2hfY2hhbmdlX2wyX2h3X29mZmxvYWRpbmco
cmRldiwgZmFsc2UsIGZhbHNlKTsNCj4gDQo+IHNpbmNlIHJzd2l0Y2hfY2hhbmdlX2wyX2h3X29m
ZmxvYWRpbmcoKSBoYXMgaW50ZXJuYWwgY2hlY2sgZm9yIHRoZSBjdXJyZW50IHN0YXRlIGFuZCBy
ZXR1cm5zIGVhcmx5IGlmDQo+IHRoZSByZXF1ZXN0ZWQgY2hhbmdlIGlzIGFscmVhZHkgYXBwbGll
ZC4NCj4gDQo+IE5pa2l0YQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudC4NCg0KTGV0IG1l
IHN0dWR5IGFuZCB0ZXN0IHlvdXIgc3VnZ2VzdGlvbi4NCg0KQmVzdCByZWdhcmRzLA0KDQpNaWNo
YWVsDQo=

