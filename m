Return-Path: <linux-renesas-soc+bounces-23891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4AC1DD62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 01:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42823A380E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 00:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AE817C77;
	Thu, 30 Oct 2025 00:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="af10uloc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68699625;
	Thu, 30 Oct 2025 00:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761782502; cv=fail; b=VmumjLMsEua2+VY+Tiewtl+Lx9kr6RSl3AvMrhvn50C3+ABk31l2zrB6SkcH4fS44bb5z5yuqWceh4mHd4b7PD87WJBmMS9pIwisJPXg3Xk1azgQmz71JaNuC3kv+111Y9DdtRFkgQu2cMIm4M4nrlTu43qRfb/jzLZocZAgX3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761782502; c=relaxed/simple;
	bh=BlG0rjf6spPsEyIwhyjKeG0oEr5XcZ7YyByyaFO54h4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OLtg/8buT5b2RbMUcKyrq8xtmdPLAg2y12ziJd1pAT8vVW3q95kisMzhalHv3FHd3L9AOkyjziIQcA5kBfSoqtPcDiELJkIlWRW0LKtkQHAjqr9v/GRPRG+A4G0Fos3edSBN9+I+BF0DEGAoU2bRpKCwaO5g7xXuShGB0D6Qdkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=af10uloc; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F77m6xXtkRyuaJ0dAHRrwNcT92GLBYo1TWPQb81D9Bs/mp22HOkULp7Zb1TYKQ3LqOmcS8BAfuyhPwJEgdwMJnfh8ud2oAaxw7WoCdZxGBV1isZY7pF4Lty2CC4pme+vpg+6BUTjmz0hrGfMZnXEQLvpCTTWiDOSBq2a93INbeaz4H8OjuerPSukBDmnxrMbjy+J0PeWEo6TRPjKdtsj18yaXVbOap51yMCvAglvCM1dd58AdhiPDESk2614TYkgJS5Di7dYM/Aam0qQ1UGbVzRHeasNRzkzG9Zn5fkEe6F+UcuO7AZ1X2Qd06BQYPBDbxMfLneudX43ZBRdwEU0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVpnUI6IRMa29gCNy/uSa4g2EYJOvqTkVXx8UMVH3yA=;
 b=V3NDoYykc65GoIx++wdDIXe6pzaJu050ikkpfMoNfSiv/NBXVsCiiolFcQIaby7Sxhu390mh0XloytEQCBlxuCSv23NGAgSnOBxdIo7b908VL25qRlUB4L5F63iIui2id1KTESHLngfJ/C2VtQfVn9UTsRmjW/RQbJR0J5IPUkzol4D1JpEPjVlkFenkfLK+Z1n/YBAr7WBZVmnMpC0v4DSLCVXB62zW0XCc099uDOyZAt6bHbLn3yCmRGpY81H3ROdUreU+NlI9z05m7CGx4m5PNJCPJDXJTBW8w105ogIBIrdT+yxmY71Bm3BzvSYaUjkgaa5PTfBovDDh0EICxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVpnUI6IRMa29gCNy/uSa4g2EYJOvqTkVXx8UMVH3yA=;
 b=af10ulocfFw1REYdgXoxmoRz2p/ELMmCDmmeHRwaA7v9k5uTx6HNJrb3JDAWHuCv6l2+NGctNGyJRArQdbJ7pE50VhoADP32atmNTDPBn2570EVeVOgjsN8SY6lYjinQpUH9VB/HXkYOyq9ovjopMscefHosQj2U3V/vkR8gmy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6887.jpnprd01.prod.outlook.com
 (2603:1096:604:114::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 00:01:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 00:01:35 +0000
Message-ID: <87pla52r6q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <aQCsAEl25_t9aEeb@shikoro>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXz9egr_tye9CbVRMJws_Y-jh9jwCvTTOq0JRar7Zd_Xw@mail.gmail.com>
	<aQCjJcXaKAjjUhTg@shikoro>
	<aQCsAEl25_t9aEeb@shikoro>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Oct 2025 00:01:34 +0000
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: c33b49ba-63a7-40da-ddec-08de17477d17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ml05U6kxNmBrg+nTAKTKzdnnbB/4EVDh3wPdaE/JImKqoaAjAYJbU+EpphY?=
 =?us-ascii?Q?cA7weTgINwzMbtiL6JBF4XoR6ExeO1+nkt+IF3QCOpvvPDxeQC39dpKxsryQ?=
 =?us-ascii?Q?8QY1xUT2hVvPtNqtkeyzyrDvwNBhkithconqhG1NLLoMJCMH/2jn5+V4mrxK?=
 =?us-ascii?Q?9mmgWE62CIHeqkCnXn+Y8VkpYxmdHpTYtCywq3rBKn/FJgXN97C+50tbv2ih?=
 =?us-ascii?Q?DWRLyTQJug2bpO/4J6C32lqos918m4H2ypi9gdooE8sUdMU4HMtUcKuZLO+m?=
 =?us-ascii?Q?EOQITMsHXRC38VKmT3t5YjYoKI+K+lE4wIGj73H7DVRx32jSgqLrzbNMeN+C?=
 =?us-ascii?Q?N3GG3zNBHn61lMMuySfJk1T280yrmkJUAWOpWftpyBRFtXwjbd9df1gRZXC4?=
 =?us-ascii?Q?8+9y8kPj9aPoYhlojW2vx/aIj8QW21DrrDpAf4TSCxperU1uu8ODODO912WN?=
 =?us-ascii?Q?KvotuCWUgEAcXoe8yde/D77POQTLIpwNR/sjjpJxKSYJfPDeZBGhApUMId4u?=
 =?us-ascii?Q?N/G+ZZllvVUx9JIrGCENIJ6nlvQL12oU8sD1fQHn/iw7bdIZs7TIorUk4FUR?=
 =?us-ascii?Q?7EraFbwUC5vwtQ/eIbn5wZym0ifKDuGiGljjpsyh0eyrSPPDwTgSa9Ry9dp8?=
 =?us-ascii?Q?iK3mw/GZvQBOZm05O5mGWht0jYoFnvAAi+0RpwulVelni6uqtDrYW3SA22BR?=
 =?us-ascii?Q?nf74H535B/wHt9jQou4+yIgF3YU2DcIHmDmuqNHTRR2Cpsd9SyEnmesd5GQu?=
 =?us-ascii?Q?IQCdMWi04eFW6T+pkcH5Zz4d6drEvxxwSyPZud4P5LRggSKgkMcmOij6GuMb?=
 =?us-ascii?Q?168XUtcN3invzqiXI4+u2S8d2ODXhnNt1cGRETzqpUg6HWWbp70lRUXWn/pL?=
 =?us-ascii?Q?8fMdcaCP3MmNvihNhDgFwcqACeSlmeOsqVjNfiEIn3O5dAYmrOfIbJ1GvNcO?=
 =?us-ascii?Q?ve3PbWI24gvjOUVxVrNOxT33/UHTN4jcAIhSOAh4AihW6kyDsr/FExx/+Iqk?=
 =?us-ascii?Q?UUN1wx+Xwiw54RemkcUIWOdbRrnGexjc6r/dUMGrseE8hVDz80xyumu6eQ1+?=
 =?us-ascii?Q?vp6sk1jsFLydEEJotrtLj9nMQvU65Pq5Y/Qzqx+h8M86sBP0jfWB6jwwXTEm?=
 =?us-ascii?Q?dT4Rtv9uWkAqIPmu1L5tJYtpHE+DK8FzBLZFizwrp7BYFO+DoTiVwZ1q1SZq?=
 =?us-ascii?Q?HQFE+3P31EIu8Sg7rrju1q6ua5XRBPMFB9e0H5KYHJ2kMWSiQMjXxdvVtXIW?=
 =?us-ascii?Q?W6cRlMNTdYJeh5jw1ZEOWZlEs7BxS6JfSSb0rJIQ3W14NVXyzmERbXU/W0Rn?=
 =?us-ascii?Q?dcjC59i13b3MiHxLIQo5QDKaB41EwToj5JLOlfM2RsyRtGK9Dfk7AmqEHbfH?=
 =?us-ascii?Q?CpfnWxpCO5un7CGxH/wj+q+cuR9R4VlFE0iSm+LDQ4kMVSzPHHctR58zpeGX?=
 =?us-ascii?Q?T/NI7LUhB0ddLzoSllTOUbDk/uTUmZbh53ssZ3jYrPHSIaNj4PV/uxs3wMag?=
 =?us-ascii?Q?gLFnJD/wK5V7H0MHNYzG6K2anzVlHF5J0XxQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D+ykfiKzgYm9M64fmhNx5uwrp2YjgREnfGJZsBX8qzmiizdKx3Zjou4jMwRd?=
 =?us-ascii?Q?E/8kj15/+NWpM2wqi0x3pgyOtHCtPWziG1/LXw+DvkRodIehMFzAQmFYzBiv?=
 =?us-ascii?Q?EAllLf6idD1q54IHapRZqx4pjUqPMGwOqKI5WN/f1LnZ/yXIhL1ZnSyDW9nZ?=
 =?us-ascii?Q?0KaAjV4+59qVwsP9AKxB//PdxLX914TQ4qYX83zpCr2UMRvqiNjVo5Izjo/r?=
 =?us-ascii?Q?FyvsRM4GRJ1merr7q66txubINeIAltlcceewq56KqB4zPByrDGCoS/A2uxKk?=
 =?us-ascii?Q?K40GEMF2jDuovfnmJKaaBKCDRXEUYE5mP28t15MUU1/fLae58oq38eQJDXj/?=
 =?us-ascii?Q?BEM+XKULnnieXJb0BGsvkG3ZSuNaNLE6guN80YyEMlN+zSATA8lcw/hSYidd?=
 =?us-ascii?Q?rtiICiIHB+fCemgSAnyeDpdOmqFCh99/hK92NAaLujYg8VAqXhoTIFSltVYg?=
 =?us-ascii?Q?yIxTsjbeZtciaBb51pAAvtPnTYyXpLqCraxLU0LmfVwZupBe+r6TkBTATACm?=
 =?us-ascii?Q?Nsst2pUSST0p/Gfi938zANZDgAdVaX00qGm/FwLYv9/ScWSOUsl1AAzM2HMv?=
 =?us-ascii?Q?b7cMDIDqOxXM3HTsX593lgplFgA93S9izNIen7m00ruuZLI5yxtKdPeZPLOo?=
 =?us-ascii?Q?bqAz+A6FYyVZ5wLKbh27xYeOCHudHp0oLGI1mYfUvh5Ky8V/X0puqq5bNRxI?=
 =?us-ascii?Q?nDPAqSfDzSa4TtnaUTMdjuf8X8eQZIkw9BuMu7MkTwl99Sc8ZVqc93R8qHE0?=
 =?us-ascii?Q?TNECq9nIgWln3RdrL2pfHjh4/HtQyXXZ0T4cPYnoo6SI8YFSq9/rE0Qr+3Ih?=
 =?us-ascii?Q?Uk3J5dCHu7f3k35I9hazaJoFQa4AQSj2FcEtjZpmLOhUKTbpC4Yb5c4Ndd37?=
 =?us-ascii?Q?yOi7mdcGSvVwplsjGbxQQ6gBfi2EFjbOFh2L4O5UILXe213LnC6v/2laOpLU?=
 =?us-ascii?Q?CcW6TFj2KSUKwkUsSrug0KrLYF2CYLT2UglzjXHe5MC+KimTNI7REMOfSh1p?=
 =?us-ascii?Q?S3jNZf2R/NyeKIiDc6eSVxhlzWkB9zUWOfD9dYjdrcnPL5lDtsxf3c4hbaXf?=
 =?us-ascii?Q?Bc6rVQ4L7wtfnghrquQOpIckLKAuwkaIxBaFg2kk84dYgIDKsd5lmaAFzZmZ?=
 =?us-ascii?Q?KAHIieLgJ0pebQBisUgRfgwLcn3+w70qjK9l0Vtk9IYjGwCf2njasDXC/6QD?=
 =?us-ascii?Q?2F20Ccav7NwuKT0zfLiRFvuCqUYkuNfgprI23Xfgim7K6OgOJKBqUoZxViIC?=
 =?us-ascii?Q?gPWNwulIlsss6QFrg7Jix5NRB0gqSeHzDQPW3W3Ebp5jPY+MQfbk43FcyIuK?=
 =?us-ascii?Q?ISDxHfKs4qINdMIk7tV7kFzgh4Z76vjEhVsd4Ye+IOmK37HUa8yZgKZyvMpB?=
 =?us-ascii?Q?ghcDnKwpYjGnGhgV8qpy2Dv/ehhWKi2q3vaEugLrFK1cMp4mFCi3JZhFbB1O?=
 =?us-ascii?Q?vgheCTSO7dnktCWVa+dkDP4nZWDckw5RnynnVujAL/saeeZARrhIcllu+x52?=
 =?us-ascii?Q?spoy5TTyAdkbgS/LFoN4rZ0lnlbTeEC3z55r13gGsSoAxEQjfaqvKgIYSwCm?=
 =?us-ascii?Q?fI8LE7OSZjezq5qT9mB1ZmxpqETkXb7C1cpSfmx6TU4lTeLSOR81uRCGUJ4R?=
 =?us-ascii?Q?+s9+DOd3nlIs58QCFKeo5so=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33b49ba-63a7-40da-ddec-08de17477d17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:01:35.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aao42nh0bDbOhkm0YLs4XFJPJjIt+xCYcPVOS3pH0Beut0Jb8BgaRv9mH0BMvf/S2UEW7ZfPlFRXUQW1BXyUiChTni77quLzLHgsq5LSWqBcuvmt08AX8h5dGR9f/gEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6887


Hi Wolfram, Geert

> plain MFIS reg + 0:	AP -> RT
> plain MFIS reg + 4:	RT -> AP
> 
> SCP   MFIS reg + 0:	SCP -> AP
> SCP   MFIS reg + 4:	AP -> SCP
> 
> As this driver deals with the "AP" part, we need to access different
> offsets when sending/receiving depending on which variant it is.
> 
> Shall we handle this with a different compatible?

In my understanding, "SCP" part will be handled via SCMI (A),
"plain" part will be handled via RPMsg (B).

This patch is for (A), and I think we don't upstream (B) part (for now ?)
I guess our BSP will use (B).

> I think something in the middle. MFIS block also includes lock
> registers. We have a BSP driver for these using the hw_spinlock
> subsystem. That makes sense to me.

"MFIS" is including many things into one device/category.
So, yes, MFIS lock will be handled via other driver.

> Gen5 has 64 of these mailbox TX/RX register pairs. It has additional
> message registers which should be included here IMHO.
(snip)
> This is an 8-byte block in the middle of the MFIS register space.
> Perhaps the DT bindings should describe the full MFIS block, and not
> just the mailbox part?

The HW has 64 channels, but Linux will use 1 channel only for SCP (= A)
(for now). Other channels will be used by other OS for other purpose.
There is some chance to use more channels if we support (B).

> It has additional message registers which should be included here IMHO.
> It is usually at offset 0x40.

MFIS is created to be used more generic purpose, but Linux don't use this
message registers. I guess customer's custom application will use it (?)

> Note: if we want Gen3/4 compatibility (I think we want that), we also
> should go for one MFIS DT entry. On Gen5, every mailbox is 0x1000 apart
> and has all needed registers in there. On Gen3, first the 8 communication
> registers come and then the 8 message registers. So, they are not
> seperated like on Gen5.

Indeed Gen3/Gen4 and Gen5 regster mapping is different, but we need to use
is TX/RX part only. I think we can keep compatible with them ?
And, I don't think we will use MFIS on Gen3/Gen4, because no user,
no software.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

