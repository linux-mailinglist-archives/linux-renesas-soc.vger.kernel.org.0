Return-Path: <linux-renesas-soc+bounces-31069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICAfCul312nTOAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:56:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 989393C8C7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55649300B3F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772C73B0AE8;
	Thu,  9 Apr 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jd+Iad3f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C93A9014;
	Thu,  9 Apr 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728548; cv=fail; b=LDyfOVAE1zBq63rwYVd/aSncMPSAN9MHRB7sQkUJ5/IeCZlZOHFdRc5a8tytI1WfZHBg3gF/5jFootpWdVhBflw43kIp/epbb0zt8ef6ZBiZvM9xgNgt7J/2HMmCRoE3usjyqwYySIJIdQZEx3fiJmtvEAuGMKvNEKxOoEnB1xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728548; c=relaxed/simple;
	bh=NXjXsJfwp13Svkdk1F4vqbi2Jqum9Or6QFOoOQa/zUA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UAXWED5LWKmTw7Xt/DKWyR/0XiSCrtIopFNMKevQLmidobxGnEJXmzkX0MbMDHx+rLR1RLOA5VmfxqOWprSJhkfRmM2fuU1QtZdNmBoaIJ6wV9mdN9q6Z7eTiIEcw24HAcgL3yZo9FzkNH1K7XlsgFTFwAu5yYIBB35H9PnXh40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jd+Iad3f; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRPwtUA1imzH0jyhoSsIdn/GP6ECm6Ci62Tz4zJ9rgqcV/9CkQddmdYeH9pZ1hnC4WzA09SWclBvcQgBinOhYdUECcfhogtvijreLNZl1t6nUi4Fzn4NChfQe082FKEnaN+VO8hXx2NY4WDpGYVkX6vz4cAklN6Yd8iBrdw2M0ukzxvsZc2qTC5U+qv2WJwOf2OwkPn+Lthw0s99fM649OKu/widosSUMcppoXT6+EL5Tba9aZvzKqP9Xd1O9udtn1SK1U37/A1WorQwo5yfohk7qIUAdwQPFb0oVPy3E/jtotF0bo4GyMUpgiuE5JtDIiBh9DJPEoCpLsPs8xLomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJcb+3v7Q/xXXimn2OMdtjwmnh1iXeZksZRJ4fULa0M=;
 b=frbXiQ+YLKnuN5/2vLVOU3pZnQqiYdZV/980YhCHPCFKUrNNZ50AccRoFHhKy+yY/DzyvGVp3WI2hj0iEGHty0SlXf15m+ET3WKmB/1BNHZeCM5mj4Kn8a595FnTqTA+oglPaVeLT+W3iRcTEkJml49qirlNklqXEFZQu2hAy92imxyrE2oVYCdja0+oNfR7wE0B694+P8shT9zlNT4AkAX9LT7YKOr6Ti/F6QsuD50G8U1mXu7VMU/wQdL6OUmWcxrwmchIZkzS87AyroMlGwxhhzGvUw1I0kmYIf83Eys1lojric2CCLKtWawFyduz6TcVam1zQXJqcIYSdKEZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJcb+3v7Q/xXXimn2OMdtjwmnh1iXeZksZRJ4fULa0M=;
 b=jd+Iad3fNQa3VZdr5WRHg5QbfMHJYGfAuqHuwu58CWOdYd7reV2O+c5vIZd7azjI9Yv6727ZKHP0bm3AGMKwoPOt7ynNDMEE80zEC1FVK4KCsVP+7r653xiC8S4cwkX79JODQgB1RylriMX/0RbV1QJfY0ePGybOhFDu30Kkw3k=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB11952.jpnprd01.prod.outlook.com (2603:1096:604:23f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 09:55:42 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 09:55:41 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "paul@pbarker.dev" <paul@pbarker.dev>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "kuba@kernel.org" <kuba@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>
Subject: RE: [net-next,v3,01/13] net: renesas: rswitch: improve port change
 mode functions
Thread-Topic: [net-next,v3,01/13] net: renesas: rswitch: improve port change
 mode functions
Thread-Index: AQHcwqCT7jcYdhji+02QFuJeYYl7c7XWiFIw
Date: Thu, 9 Apr 2026 09:55:41 +0000
Message-ID:
 <TY4PR01MB14282F72928B89005E61BFF9382582@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-1-c37f41b1c556@renesas.com>
 <20260402125912.234434-1-pabeni@redhat.com>
In-Reply-To: <20260402125912.234434-1-pabeni@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB11952:EE_
x-ms-office365-filtering-correlation-id: 4de44ac6-bf49-4cff-7283-08de961e28f1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 rCNZPfKkkdb4xfaueOWo9Aa4TxENdCd2RWz4W32LKUYsFz+0PGIO1qcQwhBIdW/xW2LLSLwgiDaAcAXqoj7Nro4On1jkZEK+D0dH9JS6v7M6ynOfTiyB8Zp7wzsqYw4uEdeu/xpbCYoZpF9bnne8R8DEfrwhMmuuI/qpU1xwuh90UjaPiWjV7Sm3w8vysHRAJJg2KFT3ayoJQuLzk2WOmVff4uuN6Z7NkMxLrsN9akm1TLAIaRL4T25MLNij0pOE3tuAMHwCO7AY52vLyIrgSz3D24RBzkcMvSlzpO0YmobiXyIUPY8RjH0ROaTqQ2hHQypsGdNM67qn1xeugw4ekMWS8nezG6wyEkhQbUUq/bRrAlzyEgJHLMp+d8d3bNPIA+nx8Md9Hdh2x5HiyscAxzWeedtpH1EmqdI6hKf8SEQV+gWfSTlYoEKA0zeCw61j6TTmarbusisTug3qIzbjdIRRvt85HOqyzRf7NakrBjmQZ60fUcE+ZimrS7riC6dvEBtwgIXJQSyExsNJfFw/5j9msVJqoeIdmLrk11hUy3dD6hYfu19bSWXjUacSsEb2lF6SCfVv6eG5TaA2/w4lDbbXifmRCmWtsXzIp/Z7rOXv68fUh7FEZB1I4Sqix8BscBzKFB6j91GkX4F2tM8dp1sS7For+udbV7LsO9oXqvlY4v2xvjKoKxWShuMCh6rl868aIAyJ/KKVsjOU8RqNW5Q+eNa37SwFa155fePhiS+HWDX6jpopS4WXYnYg3XyV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nANNlsuje3KepaUVluvZ7QunB2bJzs+c7eTXDVgV5uQSLFJ8EP0Y05oaqyIg?=
 =?us-ascii?Q?1HgsAdQ4DwrmNPPDOswjdLw/Unt0a1aeH+DSfWFvop43s+IvXh3PyzevlE1W?=
 =?us-ascii?Q?Bh4iXYjKj2s75J+s5TkgpAiWrpBuvfGtj6fpAeYG1EIJXt7U19PJBls6ANsR?=
 =?us-ascii?Q?//4Fe1zcpWxD2wO2sQ371RLqJDLfQMiafrK15k6DzlpdSl8DftuHAEkbP9PB?=
 =?us-ascii?Q?9ha3ZGVrmOyLqhWdYr90JgNcbv2qoCzTZxcMYsB4jn1kq68QIegaG0Y2wCta?=
 =?us-ascii?Q?b2G30NjiRhGyMPFQViproLlfPxS2onm+EiTnJVK6Vu2Ziobs5ZHKf3Js1Jah?=
 =?us-ascii?Q?KiWPOrMo7uSqtMUTz5xZgQWdOQtRNH+ytTukZ/b4jd6LfGlosnWhBsyDM0eR?=
 =?us-ascii?Q?+sLaQRyUE7mUWszUVZ+P22IiraPQo8vPSjrcBOrfRr70Cb74xraLTj5iLOos?=
 =?us-ascii?Q?NDGT6dsbIgyv1mXSidvvT2/372LT0UhpKR3R81ZVxUw2gjWqMOC2/2L1lVlL?=
 =?us-ascii?Q?eKa4d1zw80Wh3oF2LcUKyjqIMVTEmatJpU1RFPY3a5eF0wkIMEcDBdw4UBd2?=
 =?us-ascii?Q?su/RFG7Ck8muOwpCMj9Blpzv+M0fTH28NpaZ+mIyRCSRcPfl9tH+30JxfvMi?=
 =?us-ascii?Q?mHHe3IXwuhwTHw6ARVeFLQX5tbu/qH6wGElZcTWdycEC7C11StRkXtdpVFav?=
 =?us-ascii?Q?ib59v8aGvxT5qHA/DTGQHsFLBIaoDHrwuQPbye4pNMUR+WGZx+IExTtmFNSt?=
 =?us-ascii?Q?G9iHz6AECB6hPdeltnS1TWs9lGVGNAsbXyJthBKrXINDw4Ey+Nrw/QseKMfB?=
 =?us-ascii?Q?IC1cKkTEGLHu/5YqmfSFOWD4ve8EJDnmrlbt1rYKB+oNKCSrmRK/o27I0Jp8?=
 =?us-ascii?Q?BAybelyT3e2ynWiQf4230QekCa5xHhrQ5D3dlfLZ8vJBlTG3krExCIlV1WlE?=
 =?us-ascii?Q?MjrldP4e35ka3Y92ARdaoEPQyO9m7+ju0pqUqxCz/T/akD5eFitH0kksOLrq?=
 =?us-ascii?Q?0XL6FKoz9uK7gB0goG1bi0ctkbdq2DRcRnAM76s9pXr+ZwdRqIqNOQ6+HH5e?=
 =?us-ascii?Q?CwkvHZNJtwMr19Ua6cfCfmN2qhzf23sPXG5TBA8Nj/mOiTOS6e2kf7Ck1RHo?=
 =?us-ascii?Q?VliNcfFCb3DrVHengOJ4+TRjG/+OzjnSjbei+asoJhY6Qu/9qNh4SnDesoXI?=
 =?us-ascii?Q?+xRJvJyZKN7HAp3j4jztFilrusWaxa8JpJpK/y+lFYFvKa4Hmf1/zmpeO9Xy?=
 =?us-ascii?Q?qJ6X4ObMVpah5ScTJCi6fsL3JJJkPcsmVcmSbiX0iAigoHIgpdUzByPXkUXh?=
 =?us-ascii?Q?WuJPEAp9ii7E9nUy526woIp+56ISuAGwt23I+8tBTXCF0LoXvtgyOoNZmCyJ?=
 =?us-ascii?Q?ajbhcABwKct9ckvz+ZmbYBfgTTo5Bk7x52sUobr+tqxViSIWDlfdTdBaX+En?=
 =?us-ascii?Q?NplvAdSw21zhhlSAEJIuETkROLpceAqZQEaLxUvNsyBQC892mtXcaZ/Z75Vi?=
 =?us-ascii?Q?TAzBDCLRJ29EOTerOdM/29XIH6jWuhC8q0y8OaIyPPu5e1EvrQ+FwfgzW3S5?=
 =?us-ascii?Q?TcwBw5QqzDIzxRu+zawL4V8wau+7/GnV86mz4LDrVQdRwib/8lIOb8WxJW8o?=
 =?us-ascii?Q?kp90rXknAZ8rvLznp76SpBqpt6VSdBB2uE9+1YPG0kNQyDWc1g7uSpBffGi3?=
 =?us-ascii?Q?zCZNzfE7JYD4flr8xGqBp89UIMMpmwblaMzdKhN5Sfuub2FvCET+DWtybrQS?=
 =?us-ascii?Q?DpgeU/paTw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de44ac6-bf49-4cff-7283-08de961e28f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 09:55:41.2838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1SfyICF/990ssT4VAeFyv7mG3A/ERy21W8ON7SPfaKHEvNmwxBGgqZ+ltzCH0SzwKoSru9P9mkKAbFTsInwKC5D+Yv/iP8/lJtxNUMvpdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11952
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31069-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,pbarker.dev:email,davemloft.net:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 989393C8C7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Paolo,

Thank you for your review.

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, April 2, 2026 2:59 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: paul@pbarker.dev; niklas.soderlund <niklas.soderlund@ragnatech.se>; k=
uba@kernel.org; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; netdev@vger.kernel.org; linux=
-kernel@vger.kernel.org;
> edumazet@google.com; pabeni@redhat.com; linux-renesas-soc@vger.kernel.org=
; andrew+netdev@lunn.ch;
> davem@davemloft.net
> Subject: Re: [net-next,v3,01/13] net: renesas: rswitch: improve port chan=
ge mode functions
>
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
>
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-
> local.html&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C4f84d222a25841bd=
46eb08de90b7abdd%7C53d82571da19
> 47e49cb4625a166a4a2a%7C0%7C0%7C639107315837152138%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DDbF%2FVyoOLfJSYrnI
> ceiszOHcbvGrEtenm%2Fk%2Fah%2FIrys%3D&reserved=3D0
> ---
> net: renesas: rswitch: improve port change mode functions
>
> For ETHA and GWCA ports every mode change from operational to configurati=
on and vice-versa requires to
> change the mode to "disable"
> first. This was done by calling the function twice. Let the change_mode f=
unction take care of this
> required step in a single call.
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > index 6fe964816322..f6d1e610e7fa 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> > @@ -176,14 +176,19 @@ static int rswitch_gwca_change_mode(struct rswitc=
h_private *priv,
> >     if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
> >             rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
> >
> > -   iowrite32(mode, priv->addr + GWMC);
> > +   iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
> >
> > -   ret =3D rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
> > +   ret =3D rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK,
> > +GWMC_OPC_DISABLE);
> >
> > -   if (mode =3D=3D GWMC_OPC_DISABLE)
> > +   if (mode =3D=3D GWMC_OPC_DISABLE) {
> >             rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 0);
> >
> > -   return ret;
> > +           return ret;
> > +   }
> > +
> > +   iowrite32(mode, priv->addr + GWMC);
> > +
> > +   return rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
>
> Should the error from the initial DISABLE transition be checked before pr=
oceeding? When mode !=3D
> GWMC_OPC_DISABLE, this code stores the result of
> rswitch_reg_wait() for the DISABLE transition in 'ret' but never checks i=
t.
> If the hardware fails to reach DISABLE state, the function silently proce=
eds to write the target mode.
>
> Before this patch, callers explicitly checked the error after calling rsw=
itch_gwca_change_mode(priv,
> GWMC_OPC_DISABLE):
>
> rswitch_gwca_hw_init() and rswitch_gwca_hw_deinit():
>     err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
>     if (err < 0)
>         return err;
>
> This patch removes those caller-side checks but doesn't replicate the err=
or checking inside
> rswitch_gwca_change_mode(). If the first rswitch_reg_wait() returns -ETIM=
EDOUT, should the function
> return that error before attempting to write the target mode?

I have fixed this and will provide a new version of the patches.

Best regards,

Michael
>
> >  }
> >
> >  static int rswitch_gwca_mcast_table_reset(struct rswitch_private
> > *priv) @@ -682,9 +687,6 @@ static int rswitch_gwca_hw_init(struct rswit=
ch_private *priv)
> >     unsigned int i;
> >     int err;
> >
> > -   err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> > -   if (err < 0)
> > -           return err;
> >     err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
> >     if (err < 0)
> >             return err;
>
> [ ... ]
>
> > @@ -717,9 +719,6 @@ static int rswitch_gwca_hw_init(struct rswitch_priv=
ate *priv)
> >                     return err;
> >     }
> >
> > -   err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> > -   if (err < 0)
> > -           return err;
> >     return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);  }
> >
> > @@ -727,9 +726,6 @@ static int rswitch_gwca_hw_deinit(struct
> > rswitch_private *priv)  {
> >     int err;
> >
> > -   err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
> > -   if (err < 0)
> > -           return err;
> >     err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_RESET);
> >     if (err < 0)
> >             return err;
>
> [ ... ]
>
> > @@ -1116,14 +1112,18 @@ static int rswitch_etha_change_mode(struct rswi=
tch_etha *etha,
> >     if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
> >             rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
> >
> > -   iowrite32(mode, etha->addr + EAMC);
> > -
> > -   ret =3D rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
> > +   iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
> > +   ret =3D rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK,
> > +EAMC_OPC_DISABLE);
> >
> > -   if (mode =3D=3D EAMC_OPC_DISABLE)
> > +   if (mode =3D=3D EAMC_OPC_DISABLE) {
> >             rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 0);
> >
> > -   return ret;
> > +           return ret;
> > +   }
> > +
> > +   iowrite32(mode, etha->addr + EAMC);
> > +
> > +   return rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
>
> Same pattern here in rswitch_etha_change_mode(). When mode !=3D EAMC_OPC_=
DISABLE, the return value from
> rswitch_reg_wait() for the intermediate DISABLE transition is stored in '=
ret' but never checked.
>
> Before this patch, rswitch_etha_hw_init() explicitly called rswitch_etha_=
change_mode(etha,
> EAMC_OPC_DISABLE) with error checking before calling it with EAMC_OPC_CON=
FIG. This patch removes that
> caller-side check but doesn't replicate it inside the function. Should th=
ere be a check like 'if (ret
> < 0) return ret;' after the first rswitch_reg_wait()?
>
> >  }
> >
> >  static void rswitch_etha_read_mac_address(struct rswitch_etha *etha)
>
> [ ... ]


