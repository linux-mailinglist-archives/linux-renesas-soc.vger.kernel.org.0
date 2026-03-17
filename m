Return-Path: <linux-renesas-soc+bounces-29537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEhbLQ0CuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:26:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 576432A4BEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCB523010B66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C973738D000;
	Tue, 17 Mar 2026 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rh7wT1lY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A838CFE9;
	Tue, 17 Mar 2026 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732363; cv=fail; b=rYV3liKmR0y6oz94477Nt2mzOmfRLEdBN6cHRWIY1jJDYN0xdTbvwAHtty/Wz5NVhHZtIzDhmCFg4tGwgq/Xb+jgo2ZS0tH+ovaF9umNcGxQEiOyvoXKxgQv4jCV7vOY/bbCrS9bUAfGLe9PLP64yHAi9sZ1Pz9mzBMwECCOPFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732363; c=relaxed/simple;
	bh=vaFCvaDSogYFd+RpiiJ8qi1bJKW8yAzu6pSQTCJeCVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FwZ3AskfPTlN690oJkn6hHWvZeZJoCanBm8bp8wW0rD3iKLhNq3bCD+2ZKQuemJeKtU6z1SpvKrN8Hrs9aZkY5IFgr+QwJb4vTi7EMNecAGQVKtAw0bnPtylCWE3GvUqbyxBgW2IU7/6nXDnEsvK3czZXOOFgVQjAHI6jQPuBJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rh7wT1lY; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFhmcbVoofNYakrnLKuhbFfRFwSwWMUxha+ULYcDS7YuOtsfDKsNKBIypZyawvxpvpyBsjw1skxQAHYUog6OXXvTBBKPaFNmEVQ5yJPmU9sDJfuiWYLJhTq2zcarwBzYm07saLoWoSC7NGIl4Uiz2hDxHvrs1kiXrTBqIbx/rqF1t6qJok1zTDPINIIxDGRq1ppPmrTc9cs0uxksD7mmfYKizFCYbivOr4HQBP4NifKUb+OXWTnFjNjl2TD0ancOyb+2lzJdOeyVEZ6e674Jy4o2kmxpBnyvxa9aswA/wZ5cafy7Kyj1H7X1X/En+F0+KSBYjY+wvmfHTbsGtQo6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaFCvaDSogYFd+RpiiJ8qi1bJKW8yAzu6pSQTCJeCVs=;
 b=IDXgGyTiko8YMs3SxdJHtxtQR98n7pSo7J4rqZRuewBjP4+D/1KDAjR/XJAOdKVijOw19WTIW0EnBej2BGwiObR3Aj8Qt+tbqZjqeBXw4pndb6h1Qqb6RJpy1yyo/2NoefeOxbrQwXITM2feAwHMQ84vrZhENHLTiInK0XI+9ssHcxpAJZbS7fXMAY5xGFQRbubFGIaw2Ufxn5p3AqvuYE5onM7x82Bvq6FrI1s9mtTYk+rJcvQD75ovDuRUY+rFkgMspbaY/pA4bnJ6UoFixvKoKB+0CIITizpOjf+Grh9D+2wrUzQECQrmi/L86Srw5ZqBkGZJK7zhDU7GQHVMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaFCvaDSogYFd+RpiiJ8qi1bJKW8yAzu6pSQTCJeCVs=;
 b=Rh7wT1lYXm9FPxlhL9L7BLQel/TY29w/QmPxuWTew1jyC2R4FApNpc6dEv3XC0EcF9r8I/FnnuEaj7Y1/LZTl6qlgnG17MfSpls21w7odJbEFB16VGdi6skNPgsDre5gRLCdEIwcXfDjwqSWKaxRUkOEWdwXjxNxkU5Ah5l6ZSCArSsWeAHBl1+2RwqL7GxkweVsL89fHeKQXIXTlqeDx85k386ldS3nOJY4GQ43sDveQ3D/WT+yc4n50b3GIWwXV8SQakv/5Xp7qNB+2xGb4a98z95ZEjtHacWoV2yhjeafBXq8v7MfNfW5TggQy9OmHqAdchFR4Wb078bUqQHebg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:25:35 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:25:27 +0000
Date: Tue, 17 Mar 2026 15:28:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 07/13] firmware: arm_scmi: Make clock rates allocation
 dynamic
Message-ID: <abkCgjekyXoyRxd0@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-8-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-8-cristian.marussi@arm.com>
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fbd1c0-8edb-4d3c-58b2-08de83f65cf6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|22082099003|56012099003|18002099003|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	nFPdJ0sUU0E0SkoBEcfzSRYCcvpBVLCuBEXXjG+2B9UpojqRR2KwL4f+K2QM59Dkzo3wwCoQsimt+xK1X3xbNHuL3XD/omIXJOSc5US66Fzyxa7MAyxy2nJeqJvLArLrIY9wBLhNYYBmHKmvOkxim8ZGdG3rltKxQa25TbwxwQ1RzUnsbg4PjoMDON8Ots5eueyB3poeRJ/NZ7PvvHM6c7IIQAwzEqyqmJayW6q20Stt17XMP8gXvF7i6Zl/741s5X4TQ2LDJRBRDez/nhJxxbdgLVSsC+E9Pg2G7zOLupkqB+I6ADHitD/Pu5pYMooNTwk6ZN97ES/rWQuul0PKwupUtwVBv42t6iOO3hpJbWIm0hVNuovdWrwkNEOs4Etx4b5zByQQJPflg0qLUYVG7P8nTDdjU2S9WWmMF3XOyfSb13b2KO1dpv3ygP4vcYOo7kNyQ3Tbfc3aV+uiHAqsKaplrLgfJ1gm7bE/4zJJNV1KVXMaCXMxgk50lTM1H5Tt4CpUSpNKimIaDip9G9BNWeAEJcYub7ajvApTpTjNAL/CrQgY+5H400kk+PDqYF8dB1nGUJIuWCWD9dSWX+rwGmikPTQXspx17yjZT198vgqur67/W8UEqF5Q4D9VWQiCJq1QqIwN8hvAfs4ScOT1npJ60b+zpNCJNOTq+ImJo/3WE5eCz1TcF3h6EvYnVnvv7Thq4jh0yDv4hkPGt/ib0qccXxzwGrU/40IMEM6SrxOvE8i6qiKVB5e2/r+9U6nr/gmhxKa3CE+Q2McaI0b74aT6Gkh3KYFSozaNZWZzL8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(22082099003)(56012099003)(18002099003)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?saoL3fXF5y6L4Hvp72c7LsfK5ROunFy/R+5VGERlXF8Lc+x4Y+oX8PCuAjx9?=
 =?us-ascii?Q?l8y0AmUSW+IxdH6/vAQAVn2ALsgfVHFYindWHQsLZXkO6vrKMwm3Z7Y9tCZR?=
 =?us-ascii?Q?34zY2QJ030VrlR1K+V83bf+zf8nZApPyn4oj57AYrhoKQAu6E4PrwEX8S+/U?=
 =?us-ascii?Q?Znwr02pmCdail9zNxbqcNPWMSq/YOtzHFe0IxKSSipgD01Q894gVlpEgFicv?=
 =?us-ascii?Q?s5pI7RZoLVwy+5pKRnh0HpVxXRHE6HYmOBFZhLB1FaxYYgYE+QXspyPRgvyy?=
 =?us-ascii?Q?jvXKkwDNg5P4vwvcSWE4mVn0eryEf3NEe3BLjrHty9gX3LZHd+g6qmux7B7r?=
 =?us-ascii?Q?MmGH2GzvNhVQOawCPd7V0phd45Ahb/dMGwLkLZ2BdGGW2gVz7TQYrD+pPTam?=
 =?us-ascii?Q?L1hCFHKA1YLX9ZsDFC4NqFQJnyUeYe8GpyCEot0RZN2eNKArMTJWYWI96eHO?=
 =?us-ascii?Q?4sNsrOzjeS2hd5LcyrGsZPlmwDlbKoaMJ1AJjCZUS/yQRQr6MO/GRNclNd1o?=
 =?us-ascii?Q?Cmp/6p6JrNZAaCWCSCug/caTxsdoSr9/XZVbpc+1876Td2cGsC+OeX0zpyV/?=
 =?us-ascii?Q?DJzqK5hVdfFy7pR2r44OCiyNvh/eSMc7JHwSt6iPV2DQSMNK7caxC1jJjrJD?=
 =?us-ascii?Q?aUgyqZvZI2eUkLhZ0+2gjoxVyI34QbpsgoydFDhMAVNuvHeoPdEfbH5J5BeF?=
 =?us-ascii?Q?xUEVs+MbtB9wI95bSgtwUVaM5VjIHUaOE9vJm7Wj0xyQ2x2beTOwtAL+ofI4?=
 =?us-ascii?Q?53J+EjubnhF8Fkm1mrG9/AY+fUygqFVkR+T2Il1XVzQXgAngwlF0VVckF5lV?=
 =?us-ascii?Q?tco92ZDqzSRnESVL4HfY7WGEUX8Z/2MN6tHXUnKpyooY2ZkxvtO5oBwik2eC?=
 =?us-ascii?Q?+RUghl4L2EvjevL2Ew1kEPVz14kLOw+EOXkb9Tsqea0cJnmgjzb1Um7ssC5n?=
 =?us-ascii?Q?rFj1D7YRKgrp28inhL+2PgTc3W/Zt1ESLH1r0sSCpJq2Sf+u884pTeUH2+Zl?=
 =?us-ascii?Q?Zqb35aUBqEVUSl5H6S9m2dXK3wBOlmQ0hlolukqR0eh6QET0rjOL/VJp71Ra?=
 =?us-ascii?Q?ANQUtOsnaOEtDbILPh+RxcqEnIGoy+hZuaRDD6lOXKXNt5yRawDw5tZ0PtxA?=
 =?us-ascii?Q?XYitUnPQyK8RU6ZwMdAA2roIV4OewwWIcZrNsTFXOGqx+h/AaUInct6CgEwg?=
 =?us-ascii?Q?R80bTUE3TNUtxnFrGo+ZguUXtokssBSjm/JJ/ckCvRzXa9xx0U9cPGPQ5HlW?=
 =?us-ascii?Q?VCjSIReO65yVUMHPtKk+1yTK0Wj96bi0hF6F1x6O9g+lsdB5YC/1KhERPu1u?=
 =?us-ascii?Q?v3Ggw2xegeu8Z5KuwvvyBdevHsTxK4PO4k0vwR6RryUOxTiG9dS7niH0Za9d?=
 =?us-ascii?Q?D6kX9E7h0iBHZGKIWljn6DMxAWyR4Sd4bZZQDdFQaYw/IOVxczFsUQnE+ndO?=
 =?us-ascii?Q?6lu0NIsRlAGvzUSn9hdb6gvAKg9trDKJk7Z0GufzNdjnxMnUevwGnmGegZ36?=
 =?us-ascii?Q?8BcdUHbM9DC7tOBk64WjqmtfcHFTfaR/3MKZDCIJrTvwWCD/HwfKG8G2Gp8K?=
 =?us-ascii?Q?0bogLDN3BMqbv6k0/ug7XTb7zblyGPybu4tcQFFYA1T39QFeOCu6NYAAOvFE?=
 =?us-ascii?Q?JW8ZSJJ+MuY0Hms0QxV2o8chpzJfPqyP4uwoOMgvvFbIh6bcRrMQw0yGGIEr?=
 =?us-ascii?Q?azi0mTpRIw+qd1JO7gncLrMp6b4q+HYveniWlFZAq3tYXDr3K6yicLqd1MRk?=
 =?us-ascii?Q?Szf/DW9yNA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fbd1c0-8edb-4d3c-58b2-08de83f65cf6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:25:27.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Azteu56FXAznemodoN+tomH1b+gbDY4dbv+Rl/DCoRbWSpl1sT1SlDOXiqTYwGBQdYF8lG97DclpQ0PwXAStw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29537-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 576432A4BEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:40:24PM +0000, Cristian Marussi wrote:
>Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
>from the static per-clock rates allocation model in favour of a dynamic
>runtime allocation based on effectively discovered resources.
>
>No functional change.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

