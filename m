Return-Path: <linux-renesas-soc+bounces-29452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN5bC+aWt2lTTQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 06:36:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843D294D31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 06:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C83F13012C7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 05:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7D2346ADC;
	Mon, 16 Mar 2026 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EKkZhVA5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E90346E7B;
	Mon, 16 Mar 2026 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639369; cv=fail; b=qgiWY2tgzNhb0PTydWRyUJbM2kV500TO5VwzXf56ORqVb2yfJsSOAh3dpbUO+BPoQ4Wq2N1VEClfWxP8B6SAXa9ZYadPIStVSc0aUpZvvi2R7CxsIJVj6Cl+3AwnrpPI5irwXnrlmtHmwFIFxKiP+ZC+Gbb/Niw2klL0ZVQ7Lz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639369; c=relaxed/simple;
	bh=74T6KojxQfyspNep5H4dsk+HcOWc1nBKbL2xsHd50F0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e1ObV3bQsm5xHjyQ4k4TwmsiXFXe+pPJ9pVlLvxhzY3DNHZU3mzPopH2gSdTW952UcSCgX+wlB2MXAK2YEdXD400FO+c6q/rdyM5/pZsplLSFT0sHjTiTsq8HCnOF3wuxuQmDDz3uFyuiGK28UxIwEESePjhprA0nkwPsx0eLvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EKkZhVA5; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfFNSWe0giwtRaIL37MORHaL33lxwk6laSMHwS30kNytD8kKVv3R1uGn9P2L12XJsd3tXqVfI6+1Xr1hIB/8gAeKXVs6PE/rF6FAFc7p2YBNyhbjOEm4gvlJYVtlNB0U2MH9zJEK1eMLszWRMznCJM5pN8j1fNXmNa0J7jSgt6sZ8bt/zaH6vQIkNwT9yUSq6aTvuHdoyBEvPCSQDmBLs+4qMGbn29uvW9QhZsQ+1pqKs3W9q/NBfDm0HINsOyqUb85+yngSOp6KGA3DxgiE1S2ACZbzbgtx1ob25v3QiuE21l9DrzYDyMY+HzzoZOGi3+Eg+EcXAzZdEiIYro6Qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/Hkt9pT/fvPBsCKGMBZqmvRskiUszbrg/ljSFZWMN0=;
 b=qPc9QACdSP1V7HRfhR9wIg7R5RqeO9qff2lLzkWgDD7KLxnlikqni9FbYvwhkCvPNGwnGmYMbYHtwETTjDfq9xUO/w17dJXK0UUmaHDIuIztJD8lCdtRimmztMp3Z8uR9izDWEUajGEd7RnCte+snUIe6mfxGESx4t42nr9jV7VuyWvSTm/dvWe6muu04Gt3h3eC39mMDzODmD8IphEasP6Gc3b9I0YWIqeufFbm1Cns29DIUGHxyBoCrhIxXQW1p0Qb8XJ2WQvW2eu0M95JJSJh0hlvu/jHkoFKie2a2ZTnwqVHExNNSEplgKTSp+yc67Mio0/srW2Vc45BLDz8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/Hkt9pT/fvPBsCKGMBZqmvRskiUszbrg/ljSFZWMN0=;
 b=EKkZhVA5LNu0679teuUXNDhK6x7vgMzCPQMCfJC2BUlU34HW3er0y2NrC04j5g25qKNCXhPHWiw8fVARRZ9VvTrFSv4SvI8DzqTrTjUC+rNUPVZ4dlNBrByGjPI1fXv3hj5Wn3evMTVuhvbYnI4VMvBx3yKX/6tA6A3qfc+NeDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS7PR01MB11926.jpnprd01.prod.outlook.com (2603:1096:604:23a::9)
 by TY7PR01MB13924.jpnprd01.prod.outlook.com (2603:1096:405:200::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 05:35:37 +0000
Received: from OS7PR01MB11926.jpnprd01.prod.outlook.com
 ([fe80::5dc9:6df2:ec1:ab9b]) by OS7PR01MB11926.jpnprd01.prod.outlook.com
 ([fe80::5dc9:6df2:ec1:ab9b%5]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 05:35:56 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas RAA228942 and RAA228943
Date: Mon, 16 Mar 2026 13:35:40 +0800
Message-Id: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To OS7PR01MB11926.jpnprd01.prod.outlook.com
 (2603:1096:604:23a::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB11926:EE_|TY7PR01MB13924:EE_
X-MS-Office365-Filtering-Correlation-Id: 84363a90-a1b0-4b87-fd5d-08de831de5c6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KBi+613TyXNESLXi4q3zADlVmyfZfSgqPUBKnfDAJCCCwnGsOguKpG7VwcUVbczIikyuQHqyNLpIhpshmdCWGsxnD1ba32Habp8HYEg9EdXvShgrd6mFFqlgcQwVqXYQvfMMIGgRuQHH5euZHJc3NA1YdfoGCCANkinqDEqFWw2S78LnmIkDEDsC2ALXKtOQRFGE4jK74OyRFNeuhYTtNFcaPLo8E+WhXgPB+woFYM3mEKver6lrmZZm71RHCMk/fiV4f9549tooRDs8/PnFKCME8sc0i8q4mDZBG6lk8xD5mRAryI7PzZr1vkJo0xbXXnRz6CCq6alnlhaUZ6tWrdeLMD7ySwEP1mi+km4RwPrXF8Bhw7UxDOJyj5lV2Pwsufi1+/uMyYrDxrj1Dbtm3S71Cudtu7NNoM7oNxjQBoXGBEyRGDyjkZL7XqOolgARHby0BAC90T45VjA3gaE+ihcZYbecj21hVVosSwHntvZEDw8y4UQM0sxymMbisG8CppJNNDAPLpFqcBNOdpNKRoUmCzp63OfETeh2dOoir17Ppx8n4xE6+OjZ62DwzkCfT1p8/NtkkAh/8eTB5tWXvi4FVPQpJ/moq9edHhqmjrjB3E9nItByKvOdkAVo7FB1ear4nV29KrwAFLtQTIb2ZhEsnUb8lKKuqsjeVql+1rIXpU1ZINT8TNjWQ1c2NeR1iGX/a1YRa6IjrER5UGAdpZ8E7+QyDv2lnNTZbKnWFqjuUGJ3bnP8+hzZ/zx4k+NPM3ZRmsu5qxs+9bLnowGhO0CEpmLAAM6B72o5qREfGhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11926.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUwvUFFTa1NTYnY1TG9LMVo4WXJkR1lVbktmK3lZNFJVMEdiSzE4VzNYaVhJ?=
 =?utf-8?B?MEFSTGYxZVpQVnJFOFJMNDBqZHJ3T0tCcnY0RW9IUmVid1RkZE5tQWhUcDEz?=
 =?utf-8?B?NzRBKzZzRlZDbHZkYndCU0NXaUw1ZVZuc01sbGVGMkJqYjJGUitGcWc5RmNq?=
 =?utf-8?B?czB3QWNXaFZVTU1ZYTVXYndZVlVoT09NREowcFVzVTVrNHcxbk9jbVp4MmY3?=
 =?utf-8?B?alFpN2dhcTBkRkUyNWozMUZwb0FsV0VDS1NLRWV4eTc4dUl3RXdkNW9LYkIy?=
 =?utf-8?B?Q2xPeTBCQ3hmUDRCY2Qvdy9hS1dhZzg2YWJ5YW5yTnhlOUpEZDVjQ2gvRGk2?=
 =?utf-8?B?bTVteHdUcFJuSGZ3cy85Wit4NGtONDk3S2Y0WFRyUzAyZG5VK0k2dmhqSXlU?=
 =?utf-8?B?Tk1RMVM2dXAwUGRmeEpDUWFUcUxkRDdHUHpSdmJkSEF5V05JNnN5VjNKV2hs?=
 =?utf-8?B?aGQxQUZtRkFMOXVpdW1pb01xQkdyMHJLQ1Y2YlF3eWxjeVhSckY3eE00VmJW?=
 =?utf-8?B?eFp2QUMzMzVIQnhwaWFVTmJXd2NuaThMc1RzaVZYdEpPWFcxTzlkZiswWkRD?=
 =?utf-8?B?RjEzVTRHR1VIK00welRhTDllR0ttUEowaUhRZm9ocmc3WGZkcUtqM2YvRWNS?=
 =?utf-8?B?ai8vb1hvUDk1dW40a3dwNWl2YUtwaW9nY1FPYnpCRThkYk43WnRkOXFSdGx0?=
 =?utf-8?B?NHRvMUgvZzcxK2RBdjd6VnRTWW1kMUhnVTI4dkE5ODBxcHFFWlhYa1F2ejJp?=
 =?utf-8?B?VTJsdDhTMW9VR3JsR2lYQXQweTlacDhLejhXbnRQWE5nK2lpNW5SYWdVY0pN?=
 =?utf-8?B?Z1h2eUVzRmhRY1NVdlJOZXdvWW0vN0lXUk1kbTBVWDVIOUxlTmF0aVZkUFlW?=
 =?utf-8?B?emVYaTQ1UFFTeUlNdVZ3MmRnUmgrMjlxTllsOHpYTFJUQ25jTk5ud0ozQlhD?=
 =?utf-8?B?Zm5iTnRuTWdsaWZHaTRIeStpY2lKdFE2QldtaUpLaEs1cUpnK2JHSG9BVzZj?=
 =?utf-8?B?UHVpL2FJaGszRGtqaFhFejU2ZWU3VWlDR1BHVVVwZFNhNjkrTmR2enNjanNa?=
 =?utf-8?B?V0MzdEFFbHVqU3ZDcFA4OTQ1cERNQzFWa2ZTMzdJRFphWlZsQW9zckwvK3RU?=
 =?utf-8?B?S1pGd3N2NlZEWFVMTXM1bmgyZStHMXlFaWIrNHRnOEplYzM4NW05d2x3dUg0?=
 =?utf-8?B?ak4vUTlhUHJqSmtpeVFBdEJwQlcwRDJYNWlyd0hsTVlOYTg3YUllcndxWEtF?=
 =?utf-8?B?VG9qOVZ1YW9zRnVkTDNxSEhXa1ltbXN1aUlTZ0M0c0hNUWtsbmFXZVo3OXRH?=
 =?utf-8?B?N2dXd1JQdHVYNmxrM3QxcjhQemNBYW0xOC80UjdDZEhMMzAvc0IvejdZK2ZF?=
 =?utf-8?B?YVJCL25rTUVvbDluUlU1WWpRN1N3eWNGNVVMbDBxWmlnVUZ1R1NQWU1zb1p5?=
 =?utf-8?B?a25pWWVLbFVxc2IwWVpIT29TSGlKVTA4ajV3Ly9kWXRzV0FoRFp3K2JMVC9E?=
 =?utf-8?B?R0ZlOVJMd3pFSWN5SmoxRFMrU1pyS3RjWFFNWjFkWEJZYUIyS0VzWnZaQmww?=
 =?utf-8?B?MFBGcTUwbkc0cU5DcEVlU1JUaDBuUlBrR2d6Zk9LbUJHSW8yNWJrRzA4eXA2?=
 =?utf-8?B?VFVTaFlITVowMHJpQ3BWOHRvWWx2STF4TVpsenZZWDFkN2dUdTl0WGYrSXhO?=
 =?utf-8?B?MlZMOXl4eFJnQ25CcFQ2M0g5ZjkyQlhNRHhtZk1WUUxHTXNURElSajcwVWVq?=
 =?utf-8?B?T0VnN2JEQzRJT3c2MERFanNYaHhHRTdkTTkvY09WcnNvb04yd1QyTmlJWFgr?=
 =?utf-8?B?REhaTVJKZktjai9IZkNIOFpLMDhOZG9oYzlzdHZHaHVWeitKMjN5Wjc3MDI5?=
 =?utf-8?B?aGFwbzBiVUFXMVJHOVFmVjZUSTVhQTZxZWlmUFUzVldXbUFZYXRBdXg2RFpG?=
 =?utf-8?B?MkR5L0ViRERjSVNqOVlGajVvSW5oYjRqaXE1cVliNTZybW8raWFxdUV3NjNO?=
 =?utf-8?B?cnZiNThkSmZPSm5DWllNVFE3b3NCVUpnOGRDTm9ybnRxb29zd3RSeVh4ZmhQ?=
 =?utf-8?B?MytFd1NVRGhXOW9sTm9YUzdkVmhuVlkrWlVCYm55T0ZESERWY1BxRDY3QnFr?=
 =?utf-8?B?K3RvTXMxa3lmZVU5L09lYWt2elAyUmQ2SzBTUEZnd2FSS1I4MzBYUTQ4ZVJD?=
 =?utf-8?B?QzZwZVU0TVkrOVNwbEhoeE1vcFdnaXA5WVR0QlNmeUJHdk1ZYVNDMGFlcUdr?=
 =?utf-8?B?Nit5elRPSktQOW12MmNBTjlpTkJVU3crWWdySi9TZEhQY0pmRWVMeTVQQkZY?=
 =?utf-8?B?OGFiRDRKc1RxWGlOQWNBaUUxOW1HNlNzVXNFQTFzbUE4KzVXSWlZQT09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84363a90-a1b0-4b87-fd5d-08de831de5c6
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11926.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:35:56.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HiXpf8v5+Gucbsvtj8ZagfN2QjZ4rw/oucJQx3aRmbAwQl9DXpQoNxHMPib2FFwuE5hBJyF4UNLyy0D69cmAS9Hi7vtBKg5ZK4TKC+4bKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13924
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29452-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8843D294D31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both RAA228942 and RAA228943 are digital dual-output
16-Phase(X+Y ≤ 16) PWM controllers

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
 drivers/hwmon/pmbus/isl68137.c   |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
index e77f582c2..0ce20d091 100644
--- a/Documentation/hwmon/isl68137.rst
+++ b/Documentation/hwmon/isl68137.rst
@@ -394,6 +394,26 @@ Supported chips:
 
       Provided by Renesas upon request and NDA
 
+  * Renesas RAA228942
+
+    Prefix: 'raa228942'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
+  * Renesas RAA228943
+
+    Prefix: 'raa228943'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
   * Renesas RAA229001
 
     Prefix: 'raa229001'
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 78cff9712..da2484d42 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -63,6 +63,8 @@ enum chips {
 	raa228228,
 	raa228244,
 	raa228246,
+	raa228942,
+	raa228943,
 	raa229001,
 	raa229004,
 	raa229141,
@@ -478,6 +480,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa228244", raa_dmpvr2_2rail_nontc},
 	{"raa228246", raa_dmpvr2_2rail_nontc},
+	{"raa228942", raa_dmpvr2_2rail_nontc},
+	{"raa228943", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
 	{"raa229141", raa_dmpvr2_2rail_pmbus},
@@ -529,6 +533,8 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228943", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
-- 
2.34.1


