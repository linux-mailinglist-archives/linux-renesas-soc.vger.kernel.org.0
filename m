Return-Path: <linux-renesas-soc+bounces-34056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ziTmDzi4MGpgWgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 04:43:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A602968B860
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 04:43:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=OPfnoXiw;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA32F301C94A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 02:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AF43C0A05;
	Tue, 16 Jun 2026 02:43:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D061FC7FB;
	Tue, 16 Jun 2026 02:43:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577782; cv=fail; b=SMve6pOUHW6aWuSnxWmk55F0/hE4Fe8+70d3C3aw/npEcZ2rp3vKXshsr5OlfRXTfHD4/kmq8VcOhLK4GMkN4O9odLejgZrincy7FFdN7AgrlUVaEPgxfE6kOpWCpCDNZa+t4RUpAyyzGz+6zQjS2zOE2YP/VQ1HsMvkDKOnYcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577782; c=relaxed/simple;
	bh=pa+7lR9Bd2zanCX3Kvfpspyz0juJ2iprr5zxN91dvrI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OMIIX3G5ZWt+UDd9acDJYijw0WrBnrM0IRaEDHN5y6GoZPqCtKnrDpynjpxF0rSRRKm96+rpD2cIcul7WizHqkCzeWhVm/SUaR2xu2KMLxawfGB2YVDLa+fMeEjid2++Si8vUjH4E8KpkSI2DUqGXQy4hgaFk6zfzb9QYtptFKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OPfnoXiw; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akUlvK+gSZGVRVM4tKOwpFObTRZsA4aCdUUoQ859cJlNMlFn7EgM/BM6LzLJ+NVVmHm3cqwLt5KDvdZY0x9G65CUxhG2+OuGk4GVm/4lbE1GRWysSnOzWZYRGhVnszx6lIKRRW+gSO1/PPKRCUp3bHGjHUC/RycTxzKQFqgZ13H6CbNa4NFSnx9UPqDjN/uCaSUW2i6T02WqJMKoxX0gskecnJn94SN26Q6uiXan+/kS3lCW0UL6FLelLDIBh4ZJXzm2OOsP24GB9N0S0Qe6jDiGb6eGWwUJ6enYaUECB1vIG0+77OTQXRE3khpcpqwPvLy5yos/ADHH/qI8GONraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvaYz9t4HsmACcIUaGtzRbXmE74npiMiEZ+Eh4XAuM0=;
 b=YBNOOT4/lTBBfvcBM/nRwhRE3TR++UcpExKlkLXfqZCof+NUcncsgiXNGTwsZwrGZZWLFkGw+6wX3/fEavuTScjm+xayNfUXnVE6tXWRKTxn34Il/1+rQRYHiMolEaMueAiwaQ5UPSbAZ+KnT2ZDsVA/CYnaAKlVJmHwXvg73UYrKJoTGHpUflYl84H5LBcxAIyCXK0qTwomOz1UMTL+96+EA7BAQwG8PhhRaAZksGVTjynfB/dyAC9KiRXoamk/N01UsqPPRuOGmfmTkVnEpCLwfzct4oOh/krE2VdXTSstmksyrvw/weCH00qcDhNAdbWewyBcpJ0XszPwTIQ5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvaYz9t4HsmACcIUaGtzRbXmE74npiMiEZ+Eh4XAuM0=;
 b=OPfnoXiwcntC9ZiZa0z01eu/gu9neD2HyQVm8ipJ5RSwUzBlbOykLYCsXZ8MOAaSXgA1obi/6/yv/HyjucAgfg1/yjFykvTtX19dAhBokWcq3tL+3JgcDwH7yoMSZCstVI75BiD6gpTtsB7SkWZWJP0rn+SmG1f7Uf3fE7cOux8=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB13774.jpnprd01.prod.outlook.com (2603:1096:604:36b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 02:42:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:42:56 +0000
Message-ID: <87pl1rmci8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org"
	<broonie@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com"
	<tiwai@suse.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com"
	<john.madieu@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
In-Reply-To: <TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
	<87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173775D8E134C9A90BB069334FF182@TY6PR01MB17377.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Jun 2026 02:42:55 +0000
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB13774:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d313b6-c8df-4fd2-1a9c-08decb50f87d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|23010399003|22082099003|18002099003|38350700014|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	e33rm4ilDA18xTcq+GbSkrs7DEkECrAdcUX0pNnNSKyvMuYnSOqkgRJKbE9+gEdfeUOu2nXg+0oxRj+qydXNT/txf/BBTmc4A8X5y4vwfuFUJs3xM+1GVWbknhCPCH8d3RdX2KH7HfYrauhEVPI2EDCE/KmubBiaoxaY9lVkgIgUyU6ZuXIBHHAyD2Whvyi/VDeZg3iIHX4w8cvHuFl81wxONwt/4RaRgsikFr0snVPRhczrejqpC82+RTdlRomJx+ZLxN7mbR/qHrDMuWWvnEIstOhHw6N724GBUA9AS3e0l+OiH7o+5z/d3qoP0NivF64KCveIITGM9/24kylRyODiRI/on3d5J1icmQK0+h5KiDNFmwYs9fG4BYuMTiCAGr5kbF5iCVxYnyvVRvzMbr8hzrub5GfoqAMfprzJg+rNL8N1YE9e9njkpVmd/S9kj5gua+ydaSa/M+ooWEkeatBwRUBSDIOqUO0Z9Iq7O8BeZnkqmHvT82LMtWOLVBvtBhjFTy2zLLTOZbVQgTx1zBIhrpsn0oHD3GLFwFIW7WyjsG14kM3N7wd3kJ9u/AOXZzLnChUGfGZfRptnxzNYm0ZUoI2tdvFoNsrKvTgoFniLTl7tTtdcOwcthgJANIgj5dqF+PKQz7A9Aqplhqu6J9LoPOu+H0P/Qpf/CPvINcVImyxc6DtsG9pZoVM0cq/vLp24kJPIuV3SN9TwkXhjBxDsQ28mwcp9xhaX28yZwTGLdKPhcwe764S9kG3ynDRy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(38350700014)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vbQWhHHaWp7ud935MWupSjjaC6oXfuWagG+/YeM24TUwWGR6bGvqJzyyMx4Q?=
 =?us-ascii?Q?UsGJ2UhG6ft4DOJUm4dZsrRRG2kxY2SyOBpTjPxOst7Ot2AezWFHEWyfxUWb?=
 =?us-ascii?Q?SOVmCE2lr/R/A0VLIg8wa7tHLT8+wJTzoLEL7T4ncxX5uNfDo4ekaQVrNO/q?=
 =?us-ascii?Q?HpAkhd0sf+E5ScO/1N+zXM8Fl+NydA1PoQQKFzD8fuMcjkW5VKACtazHisI9?=
 =?us-ascii?Q?g8ppZMTJ48WC0k/iXSUiM16reI0FxffcEhiCZxJ7JVykWkmbmU91LHld5yxM?=
 =?us-ascii?Q?lIHmJGRxYAnF8iUnUPMAzsFgbCFaJY8QRYmLUDTIq2SrJsJVeIdY7oj+ufic?=
 =?us-ascii?Q?k8+v2EjjSfU+8Xvf7eXPeSJNp7Ig+KSe9RtLyLu7T1WpWULqkTJuVs9NN+VA?=
 =?us-ascii?Q?WAmCvD62DkWQlEaJLPcDmUPRaLDnb6ShW00R3XGQ1qtHhxKU986M0ViOKnG2?=
 =?us-ascii?Q?V1MUGGj0WHV087SuDX2ONL21CPdK6gtDntRWzMAeOsGi4MNcInOHzHL28BOM?=
 =?us-ascii?Q?mScJGpmyXpLRJCjgFS3/Bbo7nlFXXb+SIF/Y8q8XkHCUv4TkySY4IHUG8cIT?=
 =?us-ascii?Q?Sdja0zbOg0VyelOzl8C7OEqCfAjZGxtjkq5eLqmTv9MqC0tTBNcJHLBHMyv8?=
 =?us-ascii?Q?GKFGvpZhYI9J3KZMi+4afqrtUn6oS2Z90EufHUIbiPozEg2rY/bxPnKuvUOP?=
 =?us-ascii?Q?qYNQ3nwYHPQ/wPSfPZbDSCRvCu9MZ0ntX2os0KtA6vCRLE/zGIe8Io7AxxX7?=
 =?us-ascii?Q?sZa6Z2ZwOMl+bjbxV+CPfGU5lqBQK2ewMglSDwtaVML1vs74zAHLQw6rSAK+?=
 =?us-ascii?Q?CloI2ZyvF1q3FFlUNHBOwOHfRQ3kK5+hh3f3U4seFE808lwgobPw0XLflXLA?=
 =?us-ascii?Q?T8lcTX0ChEPVD8WfYdpn1ZaEvTVQcYhOUR4yPdMeGUa9yoC7NRGPNCDfDaxT?=
 =?us-ascii?Q?XXvVH8QmtI5kn+85eRxTN/rjI//OGiIEjspNuuNptydQC3UfudkZwYasxOKL?=
 =?us-ascii?Q?0NgpaZWDoSO29lMLTopvAMv4eorYkNI82rP2AK9AU8BblRbwxX/Ntyg5h74x?=
 =?us-ascii?Q?7uS2JD8Crg9XC/j2eQ43qiutEewszbtBKWfLhNybO1UBRFM5x6XStl4dkx92?=
 =?us-ascii?Q?v7zAM2HL7ufhmgcQScRQ+b0kD4EGghWEdT8d4k9wuRr2/iK/uLSyhpjkWtqK?=
 =?us-ascii?Q?FBkU+nWxA1oQzq+b6Rs/0Nc09bCt1+tZeaXYnMamOrdK8akbU2MqwHR38gGN?=
 =?us-ascii?Q?/6kdU26386Vekxtx7rIfLNXwJnc9H3GEdofRsuoyMYwOVWBugfYaQv7Ay0OU?=
 =?us-ascii?Q?4/lkRMfv/L7CDzucCgZREsDmDQ6wsW5Y8Ay8rwKFGOi7BMOzEgcN7zN8R7kl?=
 =?us-ascii?Q?NTaj995bnNILYejsFR9YAqzojrkBQ8uJgVfKc4Ir4lqWzJomoSNUQhCnp0Xw?=
 =?us-ascii?Q?UfQNaCOyy/boOxdBNewWqgbKeGVKxsA08NHWFfXKsknFES38se3nP0v8tCpd?=
 =?us-ascii?Q?yw5u98Z5Z4FE8TFmeeKQvGeGFsAn+kHenXnKWJKNgHlZ97+X203M6nMutQAI?=
 =?us-ascii?Q?eTxgDZV8A5hWmYlUy2cS/MVWLAMLQQf/gjX70j5dHnrrcQpF+h/ybrvDHki1?=
 =?us-ascii?Q?IJcRoDZ7SMRbsf3flN0YroWQXM9tLCSZwi0+f3ld7uwuigieXD2yJLiLUAY1?=
 =?us-ascii?Q?3h7SKZhutYi8G/cY/Knng3l4i6N4O4ji5uv+geYtW7Dc0sKix+5RE+k+G6d5?=
 =?us-ascii?Q?L+aRheZPyrvEzp+YgLyecGSSbT08pNg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d313b6-c8df-4fd2-1a9c-08decb50f87d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:42:56.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXEVTtnSVhVi7zdh2nkwH8KqLoYLTO4H+2eUQNv+t/4cpC3LbOuJIBg4xZ+6YRLZWDkqBb9OUVPTQtuVY60bAHdtU9BRf4q0J/FYSTol94aQ6mrXgzL3DOyw6BZePs3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13774
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34056-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A602968B860


Hi John


> I don't think it can work here. clk_is_enabled_when_prepared() reports
> a static property of the clock implementation (it returns true when
> the clock has no .enable/.disable ops, i.e. clk_prepare() implicitly
> enables it). It does not report the current enable state, and its
> kernel-doc explicitly says:

OK
So, I have no objection about the patch.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

But, now rsnd_adg_clk_control() is very complicated enough,
and you will add new flag into it. Will be more complicated.

Maybe it is time to separate it into enable/disable() ?

	- #define rsnd_adg_clk_enable(priv)	...
	- #define rsnd_adg_clk_disable(priv)	...
	- int rsnd_adg_clk_control(...);
	+ #define rsnd_adg_clk_enable(priv)
	+ #define rsnd_adg_clk_disable(priv)

Thank you for your help !!

Best regards
---
Kuninori Morimoto

