Return-Path: <linux-renesas-soc+bounces-28143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE0nC81Wi2lIUAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 17:03:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE511CE72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 17:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4281730162AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E612387368;
	Tue, 10 Feb 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ugcblF70"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021115.outbound.protection.outlook.com [52.101.125.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6E2ED141;
	Tue, 10 Feb 2026 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739402; cv=fail; b=NECmSzCzy4BBelC4Bz0uIoy/chSPQ81fcj2Q+1bWJSt+vWO0aq6YGFXNIUicB50tbbpCSQPwzAQAMk/8ug5HhOoc3vWE+sriwXhXoO7fawNDL4TM3R2JEotRQA3HRi3c0L3yB3yEaHBU8/O74G5H0t1AjOUAUefO7OOkFlRNLIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739402; c=relaxed/simple;
	bh=ft3Ex4WyxVNOqly32nzzRKb8IjBsB32skbOzkqs0p2s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DmDt3c2BJY/8FfrTLm0Jyc14sOVdWY0owG9PODXapt9wTLgIw78es08Ie+s+Mq1RakQsI+eBKBo9rdqyJ+hreriiU3z094DthC9QXYyo9R4iECUU8eYw8N3kZitPMpGw5vnEsfH5FGzLT2YSrK+YXoYbKOFGVGrSFKkuvmyCcNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ugcblF70; arc=fail smtp.client-ip=52.101.125.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6JfRLy/45YuxxtCkdjx5ZgxA8GIGZg85n81DH/pApOP19eI6YBsG251obDva03MUnYstoX++kkfonIeknwBui1EL7YS0gcZC9kqgMAm9oPtwo6B9gN9lx8wXEd5kY0dxIi4SoLcd7ugJf2tyDyFzjHm+HFI9gjLjuGzCTMXOAHB5ihHS9CuZs6oRxyiOVidzj0jLd1TCVbnQJBIIeZuXp3jBgUlKIMlBtL4iNqsb86uiYLumXgfeKnyyxvBxzBV+2HB8jcMK2VmA9VNBBB3FFu26zFcbCCxMpOCJaTK3O5oO23qaicbxarOPvWMZSQd8UJ6JbeCSRX3mmpS3xMU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK/gQBecBsU9HmS/4ereqb7EMZsQi++Kysv2G9NYrbw=;
 b=jG5WLprGh+SZ2/djc8dnkBX2AopV4z/+G7krJsKgd0V3c3NF/n3OZw0fx8QXdoJgiJDHfL3fULx/69pQlsokwib8/OsL/FU0ZVQ7ap2tWNgXphS9DdVSUK4p/Ez0JPGatb4kTB2gDRWqT9BlUagANaCPk37q6G9TyaVbPunBw/G7corubucB0Xrjo0T25noaDmTb1Wt5ZI1JEQjTRj9gSABJ/g66nldjxwWSEFD1gkXKspHUx5apdTSAd5Tj7D/GkSg0vF8oETgdxNe2Exz7ygMC89FXtqWcwRnaeVaUegPE0Tvq/Dx3MHQ/dYkEGiYUU7vQU7ydGqc7iIE8vW9AXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK/gQBecBsU9HmS/4ereqb7EMZsQi++Kysv2G9NYrbw=;
 b=ugcblF70NU9Hi6rrHqUX14uenh8SLuwzndw411y0z6m2yNwh5qncCUfFQXEqkQ9+1jgtR2IZYpViQsPQbPrFUSRQ4PgS5IxhjT+teH9143OOJIT9eIfIwSSZUzHn/EI0994jOOFr+3U5Q7HbXeWG3UpeOzGk4VRH2Q9umM1PkFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7327.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:352::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Tue, 10 Feb
 2026 16:03:19 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:03:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	cassel@kernel.org
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as Resizable BARs
Date: Wed, 11 Feb 2026 01:03:15 +0900
Message-ID: <20260210160315.2272930-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: fd129e10-119d-4ae9-6434-08de68bde812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S6oOq1E4ZRItQKByaVhp92pXPNRS8hrz2IuH2zSA8VKjqmGrdEKbBFpWKp09?=
 =?us-ascii?Q?mMpEv46/DSGgBb8TuzZEcecrSUe9dGCkJ4RIW44r14aOO/345yJtVF7h5NHp?=
 =?us-ascii?Q?33YhJpRZLRk5OOnjGLe4iCHEitIdktBSpBN/sucM+JI8XhC1OKQnYZMaWYfE?=
 =?us-ascii?Q?wdb1E58QQ8DYZEdBhhZV77ohQl/TAt9fMTQ1/pGbDRwLQKES6suTcSyZm0nF?=
 =?us-ascii?Q?L+PmRNNkMoLFE6xaAy765TARr9pSlzu8Qq4NHMhhPmY9ltuNrCIjs3Ywlw7R?=
 =?us-ascii?Q?Yl5rLWOSWhPyWLYmIpJ/J0tvAw59GpbaJRz9ujWmWKqqttlgB6kiOXD5giBz?=
 =?us-ascii?Q?dYPJv9CwVvodQ44wntRRgTnMa9k4P8rWEsE5in6FnJ/RaXTpIU81Nx2/SlJ8?=
 =?us-ascii?Q?q1Ma2P+bjLPgzw3l6R+KGHYl0WI81UgXnDot13MR9r+ApRVcWDuy1cnDbC3G?=
 =?us-ascii?Q?tKCYp+WBZxH8iG+1WaOIQ0R0RR+CPEIoPUjv4uyvQ0GGINmnwHzY1MFVI0Ic?=
 =?us-ascii?Q?NL6YWi74z4t/i1cpgooX3wWL8ILHcplP+N9PYvYRrajwNRpcFn2np8QRXlIN?=
 =?us-ascii?Q?rMtS4X09Kn55AwmNMkKN1n63C2U0CfmS/L1jdg3atnJSiCIzt33NzX4M2bsd?=
 =?us-ascii?Q?Lr5D9Go6WOYIktGk2m7xGU/zOMU852Qr2Lg3JtiXpcMYUJAdN2LZgRMKHZiX?=
 =?us-ascii?Q?rKe9TqWIil8qsVLVQSnqsDxd2VlL94abNbYEHKQj5GAMYoDJwDa/w8d7qgqH?=
 =?us-ascii?Q?D8wD7KZPCSgD3QqKE4EaHUPp6cuv0/jsTANFNParJRm7LTL/797vEvOKNO00?=
 =?us-ascii?Q?YpskSirR1QpjFZDDtjxbvS8jkx41VxgP0O7+HY9ebRTahw5Tj1sr+nPdJXa7?=
 =?us-ascii?Q?qUMLFZE9M5RKc6UhXhVgM+IddhBUosTRzwjnvoJd/lqOda+hTxhfWy1soSpC?=
 =?us-ascii?Q?SmVmMjDvxQhYcH1wp3EiaPU0yUkvpSBoStTASQ/ItTpgBEA54o60EuciBe8h?=
 =?us-ascii?Q?17HFVx3/nKdLyYk+XEFj2XwCx6luL0XEo5eF0fsalY5xbMXn3Rh9RkK2sid7?=
 =?us-ascii?Q?uJmlLt0/AaklOeAwEu6eyD0JoFpQaMFaNLDECtRn7H1S5HsBOdpZy/cVK+wb?=
 =?us-ascii?Q?+h9oTz8ULEk7ueorlXAnWf99+jGJOWmRZ+DXOAoJ2Pc3Yb8MkgJJHig0ljvo?=
 =?us-ascii?Q?36XOPjacx35EACDxFUQNyC5BeMLhzjvRswc8Nei8xb0N03ZfCOppP0JqdWQq?=
 =?us-ascii?Q?a06DwJdwm6P1hyN5tMU44UZkcURJVzqX/r/U7/qPMtQuaQFezBhm0L+26ogM?=
 =?us-ascii?Q?uVLBGOOhchvgNGXS0/LsRP+7vkDd+shqz0eEM/eb+zHPA04l5KofKKA8TEPQ?=
 =?us-ascii?Q?WanQyx33Rl4NKts/FA8A8Ybo0xT8kxB2ADxHebi6RF1g/sV0fwdHT67T8IlJ?=
 =?us-ascii?Q?c0BcUH2I7uAhGbqml87v2MpyGL7eQUmWHzSoVYCqyikj1eet4uf6zAJvTvsq?=
 =?us-ascii?Q?u7Mhxin3Ozqh9oC6Qvj8SUaXD5c8zS2kWTCKzb8IS/uwcQuBlMuUPsxhQbkc?=
 =?us-ascii?Q?x+IgQ5JjxwJu8TpKJYs057d8O39NqEWUlv1ebEFmZhprN/MhPmx6q1qHtVoT?=
 =?us-ascii?Q?IyftJHAOh4aP7OkTLCZ1siU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jdC3rIDTSl8Oe018RqIjPjLd5mUaEwzFMra1hb2y5zVD8OlDXu/MrkXr54iQ?=
 =?us-ascii?Q?uUWklOaZLFg8DlGY/Uc7siavf4MqnuvdXi7G7YzV9up1KYpmDFi03bA98Gz4?=
 =?us-ascii?Q?ZC5ri+1mfq0IjbPnWpJ8fRj36KKZhTulYcF51Ndf/Kg/P8shUApexegqAmeE?=
 =?us-ascii?Q?leUyl7WcV92qvZWd91w1v7Qu2HnpXcAXiSBeBNgURJ777InawymPe434RvS4?=
 =?us-ascii?Q?HzKtjFC0BUv8vXAIis+sr/htbrYeyvpneLkwnFsau/VyswE0/mIBVonU/H4s?=
 =?us-ascii?Q?nVYtZNxoiwYRMiHOaWvHtx2QeP5dGqf3i6C5ui897uV5dhqzmNZ+lCC21AlV?=
 =?us-ascii?Q?quJdkYcydQTZ2jr3MSVoqEVLrdb4SQrFDhiepyYpkSIGhHUBmAupAhbEYE0h?=
 =?us-ascii?Q?hUku6CzvEzI5Cqzl/BuiD89vb/gfxqSxCYHkB8XrTjX470fo/R30aHmCffU1?=
 =?us-ascii?Q?ookt0oS/fKz+rdvUcUWCBvsqL24amO/udc7bMtjzcG2qLjAuiahMyKCaIqY5?=
 =?us-ascii?Q?1pB7x991DZNEeuZM6S/gEoXnV3Xo5M/b/DeBTFvv8Y9BmmmccGhSaliKUaUd?=
 =?us-ascii?Q?VRPWkV2yhprLnlGGIsl+jWxaBAJIy2AdzShu33RYBJCzPnmLA1iSEVgwrGGS?=
 =?us-ascii?Q?fy0kj9zt0Gt4yrPhhpeQjHGfgfzSlAHpoDxeyct5qG8964hzjsLEPQXJjTq+?=
 =?us-ascii?Q?Z2EfxS7zuphJYrp0oxnynG4ozp9lIy6MkFy7ay/SPz1u/Yw0E78P+0L4z3a/?=
 =?us-ascii?Q?hUSd85zYh6AcGzLqE7A7gb5eHlz/T6t5+P+vPv+lS+ilVfuOTDdfMEvtMBot?=
 =?us-ascii?Q?DjJbbNR6CqnGYEh2/+IWKJJEgmzKiGiPMX3dd1nvDm7/rH1qJGaiNR8mdPvL?=
 =?us-ascii?Q?2nlHF6vmVxoW3DDmN1GfjVqDFIhPCiBRglTk3NZxNDCWogxXSUqG6ZvBqPGF?=
 =?us-ascii?Q?gNZAlawCH7v1dRi7Cr7tGDxrTlJyWkOmROpqxmoL+fQBXk9PyJzd3XnGHEuw?=
 =?us-ascii?Q?/y9IUmKQidYVnSvDNY+bmyNKA5C0JUjsp1pEkZYV+miiEsaW6MO687ouSl8H?=
 =?us-ascii?Q?r8Xwh4nXn2WqHUh1/7C9zISGA4TbkBx5i6hWfEijgIByowDtOJVQhkcRYHh6?=
 =?us-ascii?Q?azeVhPyvnaNnLQPN/Y35tRs5Ry2EIfGYHeJ4NwpnjkcwWcJzTI6VyLTZmcIQ?=
 =?us-ascii?Q?uUk+ZqmkHRNxMcOAh/4Fu55NGYfLw6fZjSfFgaDW/qqp8fW1xozigFDJPxMP?=
 =?us-ascii?Q?zcZ4yFArSwjkTi519JoplWGXWeVvdz/bMmZrxoyPdUUZzAycELYWkq9SiiZw?=
 =?us-ascii?Q?ZvPFlhIdb8TrTSh/XZh6yeq5wGE2DANuM3CmLiM9oGTUFrFC1wecAvHQz9E8?=
 =?us-ascii?Q?NtpXkAxIsLn13KrFn1rDLs9fMqLblyBAxcc3muwLzKRaGJ66nBWNcBTXyyOb?=
 =?us-ascii?Q?n0OKzq4/jvHtE9EZzm11rvtXXA9zFiWZxe5PqQGf05Z+b33TyvmMaaMpE8gq?=
 =?us-ascii?Q?5Mil3XdDDUwwLRybsMYaJ034vLZ4VM5cbA6zD+SnAuSh0rVBSF8KeYOQ9V3/?=
 =?us-ascii?Q?QpcZj+TuSsbQ6Lk2DIZGXu9p0qpzW3U4Dn7cJZCA5MoTBNIWtQZT62qeW3iA?=
 =?us-ascii?Q?xaD25OxHk8YEGZCpz21f/KyjbPZ1cK00z9DtvmPW/XehCRbLRKeEeR8E2hlp?=
 =?us-ascii?Q?4HMQx9bSukinu1Dnn++LFcUBQLcs53eO6YTpJrZAIQSOYbvapsvc6nTMR5VN?=
 =?us-ascii?Q?y4CcIIjWBpH+Jn0U/hMgWtmmlS0UTDoKAHxu3EnYye70C2FK7ozg?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fd129e10-119d-4ae9-6434-08de68bde812
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:03:18.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgMlD7VobpgI7kUvkZKP0cxlDJmdRFrtujdn9Lc2n1x91ONtpWABowfghe/XrQZ5h0J+WQt4EKGcl5JEWPvStg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7327
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28143-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,valinux.co.jp:mid,valinux.co.jp:dkim,valinux.co.jp:email]
X-Rspamd-Queue-Id: 53AE511CE72
X-Rspamd-Action: no action

R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
reflected to the host.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes since v1:
  - Reword commit message only, no code changes.
  - Rebased onto pci/controller/dwc as of 2026-02-11

v1: https://lore.kernel.org/linux-pci/20251023072217.901888-1-den@valinux.co.jp

 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index a6912e85e4dd..3d4a889e38cc 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -422,7 +422,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
+	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
 	.bar[BAR_5] = { .type = BAR_RESERVED, },
-- 
2.51.0


