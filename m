Return-Path: <linux-renesas-soc+bounces-6664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C26913F7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8E48B21849
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3974804;
	Mon, 24 Jun 2024 00:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZEUu0t6B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2042.outbound.protection.outlook.com [40.107.114.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D437FD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188154; cv=fail; b=CCbn1OBtxNG3lrbPXup/Gxc6e14e7cLg3o7gE6VmjuNydVwj2iXuYwSpw7Bib20T9DPMutZ/18KQrN/uCClVfVGCLrEXoPDcMk/D6FCbPen44hvNDiTOzRywd5ex5SOjbTUJJPfvMF5mTRWcTrZPiv4Jv+oUgoDU8jmD+b/Co2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188154; c=relaxed/simple;
	bh=6+wTrf5NXHcN6wD6cObtYhBltM9ERcb4vGR7EZZddUY=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ShFbvhL9lBq1IqxoUq87bAWAZtqzVk2sK54JH9vgCGUnhR66TgjvzpfSL2xQeRKkPHgKaocj425Mzo0pHA2loppfCA2Q0NUS20tU11JWfsu4DAPJmXjYn8fgFLq3unMP5jvfL3m2ikB8JTFab7+dNBfDZPX60uXDhdZT3nh8e1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZEUu0t6B; arc=fail smtp.client-ip=40.107.114.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF1lPT8Ei6wvMntYv7WM5i03zQMBE2VyBEM/JNAYTuw3F/lqKhsY9rF18eIRCLNEI36zZqwZXqai94u1usDlebRkuKYACQCv0eDj5PI0a96+wQocVTk6WJJVifnvdhAyIvtxxFINXg0nY/VIz5tA7jO4bo7tkbF6gdXbMmsKIBbtxySkNJitI6RwEhGQb2i3Ibd9ScdxPDZxEGpy1roinK0U49GqWn2dG0yTIaWHbZ9rGRWXfHJ57my2JWSHFrLFtg2w+3hB/EmN2b53miKPKt7l4kCWjRFcxMLgERbW80G5KNvDWz8/dkFYXkUEKzws10DL4KTldmDYNTRC13G1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+wTrf5NXHcN6wD6cObtYhBltM9ERcb4vGR7EZZddUY=;
 b=PysllPlOw+cJ1qwO7mK946Vrnd+MJs4vOdOH5V3QIMm6zji1N29bZzpwVnoHj+LuQ5UjukeLFCAcwRtuhjxNm5mOkttjz4fOIoD6xO5zKELBc8igcWxi+XTIsw2VG6OizqqCk2DjpYbbTxrioZpBfaJqGw9r3Dtsj3xW7PjXItXhA9DLQz4W0fUAtSCRibTPPUF+6odYp16drAw4Bq0FFXQZddmyNR172ZduUa2LlXUhZ8wSokeMxMV+jgExHiyrkwyYmGy7sCK7oFeIaLEUSt2ajuZDCaKSkwHN9V/IaW/v1GIcdvDPiK7y74KvK6rMtXWieX+KcpVs7cs0o2/Hsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+wTrf5NXHcN6wD6cObtYhBltM9ERcb4vGR7EZZddUY=;
 b=ZEUu0t6B8pe5mRCoyxo7pc56cKT3OFljktl86r8MUGVpDVjrGucb6VtPOIRf40oIbXh5RoEdZRv2IoMYwrsT8yFscHcVvhVMP9re4Cd2ZluCYoGBVR48MClT2m1rtA993dYKSFrJ3xTdKmz46jo9A+tgGuLsOBjqkqe3SqZ98dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB12050.jpnprd01.prod.outlook.com
 (2603:1096:400:405::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:15:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:15:48 +0000
Message-ID: <87ikxzkxfv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH 0/6] arm64: V4M GrayHawk Sound support
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:15:48 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB12050:EE_
X-MS-Office365-Filtering-Correlation-Id: 684ea8fd-2bec-4e57-1129-08dc93e2cca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|366013|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SyNIuK99vrqRCh3OsZZJVQ1Fk4b7ZYpIRGKBjO0dJr4YVYDDPgqfR485+XRI?=
 =?us-ascii?Q?NSsU+D7073h9ERzu6ruFvZ3af1CP/eGbS8sHkVsennXZzqTGbtP391TPzkoJ?=
 =?us-ascii?Q?01B6P9QHF7OY4Y421ouRDMM4e2HigKZ5IfpLS1nM8Kbaa1ALuBMpA23FQ+QH?=
 =?us-ascii?Q?As/aLz0XGTfg6qntMGSOol6MlZnTisuMyUo5gQovmFsCR392wQ4+TDQNnooe?=
 =?us-ascii?Q?g7qE7gapmVDbORhxNbu8bDFQxygOg5vmXsPLVh0271Fwlcr0dvnQRpAWw5Hp?=
 =?us-ascii?Q?hEPej1nd/38Ma50ED4SCoiXLB8hyrQD5uIRIC0F4j/EEMQkXS2M41yw6a5Vq?=
 =?us-ascii?Q?/kAQrT0R/ATKxjcFgH5GKin7Rlms/MTpOTENNcL5oDCAKxwPowMd8xkYkRwT?=
 =?us-ascii?Q?jXheS2SOV5aG5Sq6xAgZgjF41d1Jt1qn2ynCSoYFjM3uUYONGOJdedR0ZCke?=
 =?us-ascii?Q?rPW5K1KeNXtNfNZGiFNBMbgZJJ4+cVsLD14OVAKxhBiTZrB7R37j6FSch2IR?=
 =?us-ascii?Q?QjpvA0ClUdA5RpvPQIoaNfMdTQ0Ls2UwDH2qPAewCoS/La7kyE5eGgXDKIyb?=
 =?us-ascii?Q?Jd8avmoedcae9Ga0gSP5bgKjCZDY4QbNQAAw8Afx7JYxE52vVXXs/1Z0qYKy?=
 =?us-ascii?Q?lzKC6eyjEgWBkayWrYulWtlG1NjosXwf+UoTykCUJ2TJICt+J3wSRVqPmTTP?=
 =?us-ascii?Q?Rf/H9zPftqhUrXF9HKH2Jjq6P+pKwzrBJz8O8RP8iVhA8qXlSgRlo7xBkRo6?=
 =?us-ascii?Q?rWui2vBNpcCYBtzUMNpv2B57QLTYtYtAX1lC6kE3//O5l46r7zJtt6bnWkri?=
 =?us-ascii?Q?cpYHTw9RyjYwYhPUIT/eKO7o8F5ZXy6+XQKgiCzqfHfFClLzlmGdNyTnC/gn?=
 =?us-ascii?Q?0WCiYWPDQdOYeiLiE8w/DgKgJKDOuZUJnYptQwjxh9/iiwS3YZKmEaytHWJl?=
 =?us-ascii?Q?xWFx7OsZCQ1MTDIRQORkhBoa83FcU2woTsuh22ZFDZWFvVWoV4hs+JXjALUm?=
 =?us-ascii?Q?FpqDV21Rrx1vldpxNnaz0rHQzfWnfVwu+75lz7EN9RQGbol25KzvUzpZtOx1?=
 =?us-ascii?Q?eEzZqfuabiPhEY6zmvhzaLI531QBZ1jKkF24QwRo5JjtJZV7pY2rOw+h0ZTm?=
 =?us-ascii?Q?dtA9RpOBX+yaGXsfTWFHjt1LGL/pHapNBhczvEqEygo98d9hL+DO4GH5VLsN?=
 =?us-ascii?Q?CCRm/fyqMWsjhKudguPTKuWpKOTl7waXS1OhZ+S2+pZ4d7+lYoGEv8TwFBY2?=
 =?us-ascii?Q?OOuK0veP0PTKHIHs76EJqgDbvcCp1JAfssF7cOaFE9p0I22SeY/jIYNJsgQn?=
 =?us-ascii?Q?VvzD/rjfm1480CMThhH/jOIzrwjN1YAnby5raqAYpAQLue96tSTusG4Xscbz?=
 =?us-ascii?Q?mg1D+AA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1C3VF7lRXE4X31x0oXCjW4e+YxtvnQsqaC3CHtbtMvu/Rc+5UqDjTGI9FEwK?=
 =?us-ascii?Q?odZp4L27sm00CJ6PkSYZrxK+YaqMQftDQxTw+ZVcciqevo0kCwquNjidlwDq?=
 =?us-ascii?Q?lz0StXfPTpxK4hx7aTyVIyoQghRHlRbW3l9+a8Avvyn+DWa/b35C1ld5k9zg?=
 =?us-ascii?Q?DQkhMT0Myq39bh/UxSM2o2n1MS8PdC7luEIvUbXvkVt9nUWCPYVdkH6zAQH3?=
 =?us-ascii?Q?jx+R4+iGDbymwd7EQLhM3Oylxm0kHjwzjg9V1iqbNI3UDtoaUpBvXdqWiIoD?=
 =?us-ascii?Q?WYrggeBoV8sVvAzTzsK1VkzknOqyVLVJ5UCAYDKYdbNBQb3E1kb3ydF1UqvZ?=
 =?us-ascii?Q?rnOENcxypahnAoszSh5GHjDh43YGt4qRBk8fu2E2XwfK1jlKgUl+0m6tovF7?=
 =?us-ascii?Q?eKDcBLJbGgsPjMhhDoPyDI6Y8zRAs57aSsW0HxydQ9eti9phDjbOkcFanvWB?=
 =?us-ascii?Q?ryYvaDlgY18L8drxprGcAPGv61SMo1kolvi2DhF28kJP3Z3kRgmrRJgQYpht?=
 =?us-ascii?Q?zFlat10Xfr8QP5dS2LXjI3HkdCFUlvuiV0m2FiIY7bNAOJjAMXviNIHTuZIK?=
 =?us-ascii?Q?b3JHAkBFyizRFf6V+kxCB1DM10pGal1a4Snk0btlJ7+c/YRzTfVKrxomKzMx?=
 =?us-ascii?Q?v78dUTST87DxAC3Pran8NkcnwL1NLHpEqjN/8pN2xILcloiAR57KB1XKEXS6?=
 =?us-ascii?Q?zociOanyfEQ3SCZMk6ReY4DYGN4aLRYJH/Tx3JKA02YnZ9yiYbk+p7Hsp1nM?=
 =?us-ascii?Q?L0PJUvK3OIlP0hrxL7NSQpB/b9zNy8HNG1ytA0Ysb4EtWwOgoC0w4nC8zcD9?=
 =?us-ascii?Q?R30hvo88zgkXBV/YvvOHdGo10XjgnBbRDRsofa+t5CXQGVJEoKgjKpBF9prG?=
 =?us-ascii?Q?3GnScJPQUda5u7k5+4VgLT7k7X43jkdhrpZ7QnU4SVQw7dreGasfp6ED/i95?=
 =?us-ascii?Q?fT6pht3CZDQsOKMwSsj4lBwFvu/BBPAcCgApywq2eUxrJoENP03s0RnFwsf6?=
 =?us-ascii?Q?4/dDHt7nK1cPKKPaSOzItRRuIxyEAEvUIKYCwRzqXTUuQPVE5rR3ftit297r?=
 =?us-ascii?Q?YdO34Hw3wYcO9BS536aYiYdl5+UY1HBh9yLmiYQDXLG9S0Kv9NndjgqDke1M?=
 =?us-ascii?Q?cDSRi4Llk4Tr4T7VYAhdP2z+WJQDrSZfncRuTz3Irw3lLCTnNmwobi2C0Q15?=
 =?us-ascii?Q?EGpbwaDMx3eniUP8oYz4Bf75YMH5QHNcsC2ahinhr6N/0FWvylToa/mDKLw+?=
 =?us-ascii?Q?iGs2l3HprQaa3NIKTnpOc63DBdpGVSId79NbGKIB/e40hRuklYU9IDm6gXEK?=
 =?us-ascii?Q?PjVBc/POeINrWpsXpl8QRqNU2Jo15I6s/fiCv4+IXzCXrReEwGxQvDqWGjod?=
 =?us-ascii?Q?LTaBXg5GxwS+LamRZ7/LMyeoRgNKotv8BZpUrwYKskIBAkik3hIoEkwz+JvM?=
 =?us-ascii?Q?12lwgU5LSHuP0+xK7ItnwBHYEAqCydPDxe4I5Jj3EyON20j7mYpwRKfIGznd?=
 =?us-ascii?Q?LDYagqHxmXWXNBnfLtH7plCdYJ0wZtXWck6xxY8CeR91wPX5vouBSnyOIXnB?=
 =?us-ascii?Q?lktJJdCkJU2dzGMSKfJQiViWlStvKQN15PaEJ0Sedqb1uveJlDXHdcVP3HT2?=
 =?us-ascii?Q?F5Cen/qk90plnpPvXNIOSbM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684ea8fd-2bec-4e57-1129-08dc93e2cca7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:15:48.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zki2gm9fSwRQgi6gIni8NY51fNxipUQZ90Fxst10ukRW8/ExQinhYj/I5md8LXYNSuc3btiSD5bT0aN75xIaEOYPZmykftBJSB0iFVqWwig83YKDpW+gAj2ckmw8Ph1Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050


Hi Geert

> This patch-set adds V4M GrayHawk Sound support.
> Because V4M has only 1 SSI, we need to switch Playback/Capture when use.
> You can find how to do it on DT file.

It needs AK4619 driver which is now included on ASoC maintainer branch.
It will be merged into Linus tree in v6.11.


Thank you for your help !!
Best regards
---
Kuninori Morimoto

