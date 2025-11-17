Return-Path: <linux-renesas-soc+bounces-24701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17575C64AFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 15:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDF9B4E16BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E32D328274;
	Mon, 17 Nov 2025 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lpwTuH7X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E19D25F98A;
	Mon, 17 Nov 2025 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390691; cv=fail; b=Cy17JjGu6PehVPoy9Vwvp/mgUtcl6gjvc1qiKGavm3zZaN9jFZrBvBvNA4DXcCZgC6H41M+v33zxzwFw2Z5OEJtBsCQU3RZqlGVGFNhJiKj5fH/tT/lzFKn7QBZiBUc1Bgex2Gq6dsbcNNIwaYyXBr2pk2Di3gbPgiVU75nlMXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390691; c=relaxed/simple;
	bh=YG0zN7hKOTwnuLg+FgZSQy6npkF7t3wQq89yQJ7awSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=evqLaMKXQ7Hdqy9adFXkF1v1XARC2928lyvLJdMFfD2gOUSwDmCXEHm8V6uH9rdp3dUWe+NV5OdQEHViNQ6lz0PIdEEbk6G7mkJQqIzQ+ukSCid2yKd76SWvUW4PGvI6Yd8Igte0JwSne/v68TTUY5y9X2LtLW0rFfY9vZzpalo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lpwTuH7X; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhD8sj9l/ZlqU4jcRrq4ZjUuwO6wXYckRaWH2jgK+MFs9t9SL0LxzdltIK2ZHP2VtSOW57ZMUoJnu1mIlrO9b6f9qfLNhxO4k82nr1k/iKc2qiiWw5SUL5g7ZvLpBo9PIlP0DCKpzvrpSnffRKbhyO5Jo4PtuPUty2abndXyP9mEUSF2A4JvMrOGfxbe0TDiPID7VuIldyH45+/4EXFCRSHU0J1nvY9G3fSNULr2DkHgfY3CjCOhAH6TL09CQf33WkVmELTXTh8Gc3vBgDZTlmmku5J/rFMMYzf929QOMsmhIDpx6LV09uJyvOI3jIQgxAeglv3VndiwlwaYeFwrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsd8/XLJiAQ8bDnYGWK3aww9U6smpqs/Qj/2JlJ+hUg=;
 b=QH60GPeSeDu1eOSIuYf0j1L+j4rm6iNLngLny3PdRHrAJS0nRBeh0PanJkHQU+z8W+RAkn3GHAyw3JvN5Na1NS7gLZw6drwdLOz06ro3bL37P+7z0jyI817/ijZJakSJOTtzQK9C8TQWq+zhwTJ+Ca5e8zgbmMPJZ6TCYP7AmpGQMSQSKud5KEUYG9U24CBnhhmY9bbQmXRYVzNlDV3UyMZmEVKyvBFSl+m192XvwKk2ekbhwJcnqZGSvu0Oi1V1QIcVaESzdRoCm3axHdf9j6Hy8nQExmtwK/AehujjCKDeWjl3WZOywH+xrNUn7d6J1nL1XMsy9PVDOnEjePYP2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsd8/XLJiAQ8bDnYGWK3aww9U6smpqs/Qj/2JlJ+hUg=;
 b=lpwTuH7Xvd5YgKR0slbzTDmtzpvKIJjLPXQoyIdrm2SIrdnXw7FLzJUIjj+p49Y3KXgarW9xAYYu/odnD3GgvsVpC37zCS8uMLISv6vXt12kpo6Dj1naiyh3ZrZsnsxL06AXaOZu0AOtLzbG7YJaAUedXCsRQZ+cwOz4qu8L9v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB16483.jpnprd01.prod.outlook.com (2603:1096:405:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.8; Mon, 17 Nov
 2025 14:44:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Mon, 17 Nov 2025
 14:44:43 +0000
Date: Mon, 17 Nov 2025 15:44:30 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Document VBUS_SEL mux
Message-ID: <aRs0zpiOPO5nKLml@tom-desktop>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <20251117-sturdy-resourceful-crab-c14bb8@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-sturdy-resourceful-crab-c14bb8@kuoka>
X-ClientProxiedBy: FR4P281CA0438.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB16483:EE_
X-MS-Office365-Filtering-Correlation-Id: 378f2328-22c9-4a5a-8aa0-08de25e7d850
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8naYzz7FW1dSH0bNOhTil/S0d/HMOXQcHPh333+VeaxUJABTnunBJU1m0ejC?=
 =?us-ascii?Q?EPaWep/YBcIOx1bP85EamfOU/3NwpdK9vtDJ4XIK54mYH0idwe9pJ8K8bAZq?=
 =?us-ascii?Q?bodERdA27FLtO99IYjBa3UJU95YLsTDfJxlOVGrW20ap1XgP4mvazl9Owi/B?=
 =?us-ascii?Q?Pem0N/r7f8ya89GmOP9BZZ0kcTnBs3qSZB17IxBRoMSr3UxBWuAD5JdrsD2V?=
 =?us-ascii?Q?i0TWseC/GEHBE08xXkbGkZUuF1k6kqKrDWD2qJ4kj4JjnZb9wyaUD1oYwf/u?=
 =?us-ascii?Q?UeSNy0C8oIasY5k7vfw4R7xM6WNYh5CHlf69dKwodaybMtuVrHxlyy8G9ZPv?=
 =?us-ascii?Q?8wjAet1YIqTnJ9ryGd7K3ZNHDiLNM1jVwWF148x4oICq1s/DAZeQn+hSOo9G?=
 =?us-ascii?Q?WUe86DLIAA8EJRYxeofdDpCdswKKnf0ahBPAj9ZK6PgXz2sl9ZokXDIdZLVd?=
 =?us-ascii?Q?HyK7kwx86oyMUXsKBKxOgVoHggXp37qoKtYPcIEWk+Z9rk98ZyneRI4r1QyD?=
 =?us-ascii?Q?UNe+VoFRvzNjwyUk06HHFo5a7bg7iQFGIhOWLRTMeTZG5/4eMfsJh5KVajLK?=
 =?us-ascii?Q?Ih583JuxcABOUmxhg/ZsP+B1UyRTiR5rDxsz+WqwT4zhGTCaOwEQUPqTbSpK?=
 =?us-ascii?Q?SltH2vMbOWIx0d2zQWoIDmJrqC1TgVWslaZcN/wOVLxH/nR71xYxWhCjLpt3?=
 =?us-ascii?Q?pjqK/YQS+WrSQ6tkPhCPcQM9H8/WIsxSNFN6F/LNb3Nx3GjpL69hE/K8MRIT?=
 =?us-ascii?Q?6eSl8s/NhVCR7ieaImDijFrdqyrmJ8NrOCkE+SRjTyeVIHQj/HUpohuf1/4W?=
 =?us-ascii?Q?x7L4wz8cQdQQLDSR2eq2DMq+pDi4rgKZPbo5MEyVsGS11XVgfHETbAtu3ql5?=
 =?us-ascii?Q?LJd08GFalUDiknRZ+coHd7xXjy6FsRToRyBrW1afiYQXs84p8FnLcD7CoaUP?=
 =?us-ascii?Q?tQOzarmwYT19/Mh98/fBsZZglbX6z1BQJhYyNyykbVff2gSlv+n/cFwlR1Pv?=
 =?us-ascii?Q?8/uB7lnJRTEAjBWTS0n0TJ8dEX29FE/9DrX+LoG8PKFwJV6rSLNT7rtlsTXg?=
 =?us-ascii?Q?8JlNujwmSLl6vznuOUBcxItwalt7PAMghexTR62gEHb0x65Fc855pwRBGCJZ?=
 =?us-ascii?Q?t2e9pJwZpBuB8HvRs1yM5BbMJ3ttITncmMGXjMTIjHu3EsJWHgK+Bcn4zxQM?=
 =?us-ascii?Q?FaC94hP8NSg1iCiuIeJsg4NbKOcJ1RqKFdo4r7KFs8fSsvQ3TeiCcc2PUWgD?=
 =?us-ascii?Q?AN488qeo6c+KMuYrv7RDAc9kda95Pf/WJfXzSwjHln2bwgVL2N+TZ8cYAt1f?=
 =?us-ascii?Q?UMPoik62SEHjlEVnR1hwuXf1FJq30r78qOmIINBxQkVrTkWuVpRrfCCVDkS8?=
 =?us-ascii?Q?qsg/4tKXp3DJexrwd1t4ES+1c0ceoP6889d4b74ee3h9kuRb6Y6G3b9y1f9V?=
 =?us-ascii?Q?tTyCMsnkkdlVyosqJsq+35LYdbLbdaCtwS7BXT3TEjHm95gstRo4ImwkuZGk?=
 =?us-ascii?Q?eZfaHZQHnBMvwlNtrZYfqLowZTKteIfyPkKt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MCIxhJOVoGVdKUHJ1GlhgngjdG5rrf3JNDCVXOVI4nyIw+VD0zNhq3uzHM7F?=
 =?us-ascii?Q?nqjQWrEU4SSp0pqi2u6N2fJSkLmfOLfNe9rO4/2gPo4HBscRSyvGuHsMn03k?=
 =?us-ascii?Q?2P4/fakwuWJLXWmIvhMNcW4IATNsYRzSo12fILAaMsmvTSQ4a3Zan9QGQtJb?=
 =?us-ascii?Q?K9TJ3YLswk5oCATtyZDxuCuIYIESSRrN1qq6wwjJZwOQHLksTi2scKO5ACko?=
 =?us-ascii?Q?MdwdczLv5iMcbiPOvoD06MO6zdGVZ10dshWsVFf7ItmNqwue4yZSM5MQdGME?=
 =?us-ascii?Q?LlH8P4k8sArUOiSujnNr8Pnluh2BQQpkkYvmfPFj0wq/oMnpsMaiZCBmjTN+?=
 =?us-ascii?Q?Lafo1CfKhZuHSsM2kHvNpIxpJ7YnkKT9rWBWdotsWAIEkZhdXmuGFaggfDnf?=
 =?us-ascii?Q?60mGSNGNkpeF4bkeUBUEvvvJSVHzUGfQaRDvcO+lOpf8X1pSelWw47LG7EbC?=
 =?us-ascii?Q?OdtgpAcBjZ7jbTF6fuXTfVoeZcHQM62RVXcSQJ94VR1aBu3UvviCwHkNojlp?=
 =?us-ascii?Q?swDKQDOrbA9o4LirwcsNUbNTUAUvO2Pn0raynQp22HYVveIWH1EN4sgI4naV?=
 =?us-ascii?Q?7SVjXA9FPkoPN89Sli9b36Orly0eDm2mWdD7crbPF/VHtuXgzND001wOISfW?=
 =?us-ascii?Q?px/oGC9QH7MTAKBKMqNa+BzecNG6f7tXDw3mh5PJbalkujdXYOWwIgzHlH8S?=
 =?us-ascii?Q?Og1C8DP8YL+HL0CB4fdRvyuutBAMX3qRknq1lfeu+rgEw6vPZ74jC5P+Ecdi?=
 =?us-ascii?Q?k/Or+7lisrHQ5f4/UibeJebrVSHuSQYkDw6wUmc6bfF/Stu3s6RYIRhVmT9B?=
 =?us-ascii?Q?KAUMK2odNiBl98cQvOOKuKJL4rj3eI0z9e6ksiCPo7E2VV8p5YzbX1XVTnL+?=
 =?us-ascii?Q?Q5LFV2yRpweNBNtEULWyurRNZf7nRb4C4u2DJuZ4SLWVIEcKA/KgN1yiuG9j?=
 =?us-ascii?Q?f+6XBQif339cEfozOEX+ycgq/pf+AY50W9fPJLKLrWX9Y8Oi0owc3I1aJSMl?=
 =?us-ascii?Q?ILu38azykUcEPXDN3lbA1cOFbcOhIYxCfCn7hc2z4Gz+EKJPliSB8t2bch7r?=
 =?us-ascii?Q?4eLu7+Y7O8oxz8LALMDQwuE1BJhXUaOG/T7J0kqSAYgzeI590CqoAGGX3iwH?=
 =?us-ascii?Q?4iBqI+fBW/c6284keTYAPnPttcYwBkRIOzsh6kVLG+n99sUw6g4ehDxXjrl6?=
 =?us-ascii?Q?GNHLh7BsSRutt7SlHs90mPkLY44vMW160LOGZVjxN3SBxB/OwJv4fI0cg69t?=
 =?us-ascii?Q?DzI8WKvYzg7kx7reJoLTMhI00K8Onst5BMYNMhMdIqInR0VquPRqlZ1NeL7e?=
 =?us-ascii?Q?aU9RHQp5noIqlYWUNTjvTj3sJFnQZNLfUWqyhFB3iBMFvU6IrNzLBcw+SSFc?=
 =?us-ascii?Q?gefZv9Ox9XlAH9/U+F+zOJIopVLC8I9E3zxwqbTGnhnRAVQfv9/bmOGcG8j0?=
 =?us-ascii?Q?TnnmH2s9UjhjuAyWELMlwqaGwYh2VfGokTkpKtXG+jukVD9PFuGc53ZwYpzB?=
 =?us-ascii?Q?6tf/KsAgWQaic2vND7P6xhT887Z5swMd+iqV++F02eVKy9nVCag8oGL0m0di?=
 =?us-ascii?Q?2YQ4PSiZMyhZmo2CibPJA54/f4PwNFG5YcWgPeIDLBpanDP2r3N+xNZU360p?=
 =?us-ascii?Q?Tz98AHb2MnqEKlwyVyMpA5E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378f2328-22c9-4a5a-8aa0-08de25e7d850
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:44:43.1039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AACothaOXj0OVDhWipEdrVA2aKUVe57ZZW+0b+3mf+VckWuEwsaTzXiY/W9wqb4YrB9X2jLNxTyPlBA7Jj5CSzCJyQSPNdZ9c13Ni7fpRWw2qrDHpMgaKOx88Y2qNy4d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16483

Hi Krzysztof,
Thanks for your review!


On Mon, Nov 17, 2025 at 08:00:27AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> > Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> > USB2PHY reset binding to support describing the USB VBUS_SEL
> > multiplexer as a mux-controller.
> > 
> > This is required to properly configure the USB PHY VBUS source on
> > RZ/V2H(P), RZ/G3E SoCs.
> 
> And where did you explain why this cannot be folded into parent node? If
> you do not provide context why reviewer's advice cannot be fulfilled,
> then you will get the same comment.

Ouch, thanks.

The mux-controller cannot be folded into the parent USB2PHY node because
the VBUS source selector is not part of the USB2PHY block itself.

I will add that in v4.

> 
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v2->v3:
> >  - Manipulate mux-controller as an internal node.
> >  - Improved commit body.
> > 
> > v1->v2:
> >  - New patch
> > 
> >  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml   | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> > index c1b800a10b53..03da74ff2d08 100644
> > --- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> > @@ -37,6 +37,12 @@ properties:
> >    '#reset-cells':
> >      const: 0
> >  
> > +  mux-controller:
> > +    $ref: /schemas/mux/mux-controller.yaml#
> > +    description: Mux controller for USB VBUS source selection.
> > +    type: object
> > +    unevaluatedProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -44,6 +50,7 @@ required:
> >    - resets
> >    - power-domains
> >    - '#reset-cells'
> > +  - mux-controller
> >  
> >  additionalProperties: false
> >  
> > @@ -58,4 +65,8 @@ examples:
> >          resets = <&cpg 0xaf>;
> >          power-domains = <&cpg>;
> >          #reset-cells = <0>;
> > +
> > +        mux-controller {
> > +          #mux-state-cells = <1>;
> 
> Do not mix up indentation.

Ack, thank you.


> 
> Best regards,
> Krzysztof
> 

Regards,
Tommaso




