Return-Path: <linux-renesas-soc+bounces-29532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF2SG7rBuGkfjAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 03:51:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6EF2A2F13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 03:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE27D3036EE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 02:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DB7346A02;
	Tue, 17 Mar 2026 02:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B2MMwceW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312329C351;
	Tue, 17 Mar 2026 02:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773715858; cv=fail; b=MHOybKw7SKFHJCh6I2w96IsVzijKAMyDTqFehB4MxgszYoWnXBekXS0FWo8WzBYUmfueCq+LZsOb+6A7Ffpx3ceyO4F/Cg1FAEKqeo2h1188QwCrle0WySUqTvz6aKI5Eg8qOI/Lqkp8LgTy+Wig8RuCQ5/NmQ1cNVJgcIGD030=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773715858; c=relaxed/simple;
	bh=3I9d/RAVDDj5F0cb5oyyaaksqOvjGOLyAaLTlDwiSdc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V8VWYfyGKjtW0v+6/1s9vOmCl54DvZqKHk1FoM7CoNyxvAYi4DCmWJbereI/yQysZPspp/J2JsJqeA/kXH9xe11XhyCnWdAw4dqadLDob3pjvgPpd6Uw0rTgwGaTsgdFkxi8x4ftewImg7CCegSrMJwMKNSjzKP4PFLnj8fFpk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B2MMwceW; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0u93+RhEh+/mfimlCxCeecv9GYGMrFfZIsMsu4UQjLMkJzLhFC86TDwk1CryX7bob3bP2/zOk6IwUQr5HRv5uy22+XUU2BWy3yD0iiwVXOZUJ2GTmaTirA+UqX9TO3dL7K0Qoc+WZ/UXJJLP4FS9JV4XVJtCUEiVYonSCyjtDWxMxQvi3AJ5+oOqFLf/uQkG8lzHeG5yO2HkyK1/4RsMA1JrlYOqGHlcGEXqOhXa8ZI4xgGN3f6TvGk89MrLaIeA4RC7u6DvZNqc46KZfujTvvNIP3Yd8zgn3JBjiu8r5ZLNiy2cNHCFfBY55AsmST8fuP9zeVyQLXDjfCezUMeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I9d/RAVDDj5F0cb5oyyaaksqOvjGOLyAaLTlDwiSdc=;
 b=x7ALbedM7/FsXvuW6aqjPLDaRs539qXRvg1vOo2Ap6BGJbf3vK/5kAcJ97pSE7oFzVr4Ca/v7KUE8ZxftuUVUeimE51qrX/QHCkQGq0Zu+Q5wlsus+Y+46cfne6isecBky3FudAUdS+4zdE7QLGMgfV7ZeKZF81WYeWKA/hHsbCSEIsNeiBu4wv5uJDqfZyPe1Bna4MWM0EduY9pUS3w9lab8MT1OzK/qWgDGXg0ywaBoJLkGLc+Rxi9MoEKznTAebtZKFjisUIo+Pc68XierQ8faP+kGEVVNYYPXIXL9NDfbvV3XqMgGFXBYPewQlmE+jkLCJfGUzR8DmPwpL382w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3I9d/RAVDDj5F0cb5oyyaaksqOvjGOLyAaLTlDwiSdc=;
 b=B2MMwceWklev5htKyhnitjULi2kgG/Ajjjcq9gbdvOa3Tq9JarCKzulIqmqGszzXiiQ6Y6deyPkmPhMkDfUKEReXuP90By7BU9Ao5KL96xQcK8mL2JUg5wy4oqc9r0a7P8I49WLQaiAfN7F/LjqWUlYkd4wT1FnF/iqFZ9v0a6c=
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OS3PR01MB8619.jpnprd01.prod.outlook.com (2603:1096:604:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 02:50:51 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9700.021; Tue, 17 Mar 2026
 02:50:38 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Grant Peltier
	<grant.peltier.jg@renesas.com>
Subject: RE: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas
 RAA228942 and RAA228943
Thread-Topic: [PATCH 1/2] hwmon/pmbus: (isl68137) Add support for Renesas
 RAA228942 and RAA228943
Thread-Index: AQHctQbDkW20DY/ie0a0y/sLcaddmrWxTl2AgACzpgA=
Date: Tue, 17 Mar 2026 02:50:38 +0000
Message-ID:
 <TYWPR01MB11935E8EA8F851E93FFE271F1D541A@TYWPR01MB11935.jpnprd01.prod.outlook.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <35c39de7-773a-4f94-b495-97eb25555a71@roeck-us.net>
In-Reply-To: <35c39de7-773a-4f94-b495-97eb25555a71@roeck-us.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11935:EE_|OS3PR01MB8619:EE_
x-ms-office365-filtering-correlation-id: 1bb300e7-fc5c-4e22-4fb9-08de83cff85e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 dXWPLhzepCZY8Ds2vGYpgFX78FqIX0S+ANwLQNy8jlCO0hWZReb+4mG2p288o6twd0St+mQRZH9BLU+E3qnKDUtUmleZR4figGOsM//4ngTPyJSnHz+OXHnl+rP05tdeTdLx6zuOAfJufxAopE0MHg1kdo++uazuYm5NZC/QBje6LoAUrFknhQCbCTkgnmnhL+XWLsGhZnH0gjFHEFT8yUQNZaqYAt9xfPjlBAGVqn6Kmno9qp2GlR8ctAQZeGGYyiPw72jRuatoSLGFbqWzHR4wfP1AIqLyCv8/BzpjeEeBCDSEXFMCjIES0qcIzhZk/Sx4OIJ08uUS2sbjy898tZq0fYb6skq0W3C7fSG4dVOTnjCbDYoiU+kRNUHVTDg9EbhQ7kUTrkN8KiGMjJ+WUtjNsIXN+dXeQ0G0iqjFNpDvav0ej5VNy4WU+435qjzEl5jIK7EXjP845Gda+0vhifaRGfPDcM5fFbiZ3myXTyiQURaDFhcEy9ijxDv4DDAlXNn+N0MX9i6aGH0eQ046LwtEwzuUI49puFbCJEgyzgQbItZPp7/ZqR/P5pYkpibOZyxWGZPd6oBSdi/pC8k8tITUboLLz/ycVNwBPoyqrHjFtuzXkwztkQrAmsiZ7pnrlqayecGQrlO+SJb/PpNodPgAdN5ujnR+qmp0e0mCukUMQCYhyB0aY/74tHehpRWtR2Bynsjw02vUFv+EXJg+U/QRkidrkqFpqCk4MUBWnsNNZrzM+g+mQElpr9fJUdnR0omxLnqcIngXkOjQrfkC4LFqnc7o1SZFH0rHPbfBC+w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V05TSUVCTGU4ekJOT2VZbWQ4MWcyUkpiRG1yT3ZJUGgrcEN0R2NMZzVDWk5I?=
 =?utf-8?B?K3pHU1BTRGNWZytJWTVpNU9HSUs1TkxMd2pIMjlFNGtnUEdvcjNBejhlTzZ1?=
 =?utf-8?B?VTJXdlo0eXlTMjJxYjROU3RwekFjNkFqaWtnNkNDMEpvaEFrSlU2UnpPRGpN?=
 =?utf-8?B?MGVnTkk2V0NWWGhudytobzF3eUZzb3dkS0F6b2JxK2ZxSDRDbmRvUnBUS3R4?=
 =?utf-8?B?dC96SEdBOW50MzFLajd6RUVyT0paVkVVNXpBYWtjaXhxQmd6RkRhZ2M2K0Mz?=
 =?utf-8?B?R251RWFqcjhldy9TRklVWVVPRDNibmt2dXVYTGpIRklzOUhHVnlXKzJGZ0Rp?=
 =?utf-8?B?bFE2dEhURlZjdmo1Y1JCa2pwSlQvRjZ3U2s1b2I4eTBoU2Radng5OGMwT0JH?=
 =?utf-8?B?eGQra0I4NlhYakY1MjY5MEFIVzNHV1EwdTh1UFRwR29UKy9PbUgxMTdySGww?=
 =?utf-8?B?M3JtSk5TQVlNNERSQ3JkYnllSTJCeXhsaWZJM1NRaUN0Qnl3QlkrWjdCUDZn?=
 =?utf-8?B?M2xiTDBBT2F0QUs4Q3FCZStiekVxMjduK3RCck1NVHkwWXEzaHY3UlBHOHQr?=
 =?utf-8?B?NW1EVjJxRDZNd3VyazBKTlNQTGFZWVRhS25EcGgrbktCZ2VVam1sYVBicFBI?=
 =?utf-8?B?bkprOURUS0d3Z1RSQWNZZGJGMmlVcU5PeGxPU29hV1ZWT0ZFa1JLYWdjS1Uy?=
 =?utf-8?B?UVVITWhBUTBkUmxKbDVQNTRZaElnN1RkLzJQV2RnMXEyNVZzVFNHZitvY3ZU?=
 =?utf-8?B?WjdGTVNxNTlRVFBmY2RZV3V1UHUzUlRGRGVXam80V01KdEZLczhoM2JTb284?=
 =?utf-8?B?TE5rZ0Z4aklSR2psd0QrVG9kUy9TQXZjVlVZd3lvc3VOQzliV2kyRHlWRHJr?=
 =?utf-8?B?QXkrREFCRVdDbTZNaDREclBiek9UWUVlZU4waEw0S2tpeXB3Tjh1UjlISGdZ?=
 =?utf-8?B?R2Z6ajJNNEkrSEpDVi9ieEhRQ1FTdU0xa00zL29ldStCUFZhZ2NHNzJlZmNj?=
 =?utf-8?B?aStoSTJTa3lsYlF3cGhXYWZHR2hCODBNM2F5VnVVZE9CcWV1TW5SRkRxVWRE?=
 =?utf-8?B?QWdRM0lNanIwWGJ5a1VkZnlDajZYT1NvMnJvUFRmcFhHMkVFbUIyaE4xalZN?=
 =?utf-8?B?YjNXUjBFL2VsZjR4Y3VYN21nVDVnbmxrWkxWTzh0SUdLVTh0RHNKTjJvN0wy?=
 =?utf-8?B?RmVha0dYQXFPd04raG9lcSthRUhXN0JNdkZKRnJET1hGZUo4YkpJZVVqdmtP?=
 =?utf-8?B?UVNlM0oxMmlWOXBQeUVpUzgyYTJXRENyQlcvYW40V1FUSUxOVlphdlNVZDRu?=
 =?utf-8?B?RXlYU05vTmVjaW1SR2Y0cS9BQ1l3ZXAxNzNLOTRHekkwRE9qNDlqVVh2VzlP?=
 =?utf-8?B?S01sUUg3ekNGNmE3UHJNZTBteUM2RWJKV09MMDJOMmNhY0tVdmtjQzhJWk9m?=
 =?utf-8?B?d0RUTlB2Ukttb3hzTFppVTJiVFMwNVpYbGpsWEJFbFhrbHRuR04rQTh2clh1?=
 =?utf-8?B?R01VTTNOcFVqQzlEbVhDM2ptQWNqVUxUZ28wUkdMK3JLUXc3ZGR1ZE5MR0t5?=
 =?utf-8?B?N29pV2JHUGZlNHVvaG5DVk92aHpnNDk3N3VGMGJVOWRIbyt5UU5wNkNMVFpl?=
 =?utf-8?B?Ry90ZjB5WW5RUTF3VUFkdDNBU21tREszR05DaHRaYlUxLysrbVdOUjRiaFZT?=
 =?utf-8?B?Ukxxb2orbWo4cVZNOW9FVThOLzE2RHZtbVlVZEQ3dENYd0VOYmlsSDZtVEN3?=
 =?utf-8?B?UzlVd0pkV3FudVdPRk5vR2k3SEM4dVRtditaWkV5cjMxZWs4UnJMYlVxc003?=
 =?utf-8?B?amgvZTVneW5sUlp0L25VMzV1K1cxOXhWRHBEVEpwRk5nVzhuK2xyTE9QSHFI?=
 =?utf-8?B?MjYwL3lRUXFHVEUvL2xvREZjQVFDQjFoRUwvRkozdlNHdjYxQ0o2WVpxQTli?=
 =?utf-8?B?K2U1Z2RQVHNja25lalpFSkNLc3Z3ZkVIMkMvZnc4VnFjQzdxUVF5ZVJVQ2dt?=
 =?utf-8?B?QXJ6TFhZekZRTnZ6NjRjMTY4OUt0c29aL2lCNVI2VXFlNVdKQkFzYTROSW5p?=
 =?utf-8?B?a0pvRFlaekxMOHFmSVl2dkM4cWxTanVPblZnQytTZEZKcGg4dVN0ejhEK25X?=
 =?utf-8?B?YUJaNkpDOEh1RGRoNy9VZlYvZlgxN2c5NnV3UHBvTk1CeFZLajI3RnB1aGhi?=
 =?utf-8?B?MklScVdvb2VRdGV4VytQenhmZFA5aVU0RHRxTFE0T0xXU2tWMUg0NExHZm93?=
 =?utf-8?B?ZEtsa2FaM1gvd3dETGhZYlB6TDdhVVpnMW5nRnVTcW9DVjY0SjRJaGVKd2t3?=
 =?utf-8?B?VGdGck8rWXVOU1pEaG44U0RNRUIybnJ2MkhKaVlOaEFHRzg1d2xQZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb300e7-fc5c-4e22-4fb9-08de83cff85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 02:50:38.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7mUelkjzZpgTA8lJUd+XZEhrDITId4xNPi7WtrAyxHWaWCl85XrP5tRR4hukUSxro5tk5QH0oOZbAoH7U17D3KZzkzmMcILgaPHkaI7ml/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8619
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29532-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TYWPR01MB11935.jpnprd01.prod.outlook.com:mid,linuxfoundation.org:email,lwn.net:email,renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 1B6EF2A2F13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR3VlbnRlciwNCg0KSSB1bmRlcnN0YW5kIHRoYXQgZW51bSBjaGlwcyBpcyBub3QgdXNlZCBp
biB0aGUgZGV2aWNlIG1hdGNoaW5nDQpsb2dpYy4gSG93ZXZlciwgaXQgcHJvdmlkZXMgYSBjbGVh
ciwgY2VudHJhbGl6ZWQgbGlzdCBvZiBhbGwNCnN1cHBvcnRlZCBjaGlwIG1vZGVscyBmb3IgZGV2
ZWxvcGVycyBhbmQgdXNlcnMgcmV2aWV3aW5nIHRoZSBjb2RlLg0KDQpJIGFkZGVkIGVudHJpZXMg
dGhlcmUgdG8gbWFpbnRhaW4gY29uc2lzdGVuY3kgd2l0aCByZWNlbnQgY29tbWl0cw0KdGhhdCBo
YWQgYmVlbiBhY2NlcHRlZC4gRm9yIGV4YW1wbGU6DQotIDcxYTExN2QyOGY4NyAiaHdtb246IChw
bWJ1cy9pc2w2ODEzNykgQWRkIHN1cHBvcnQgZm9yIFJBQTIyOTE0MSINCi0gMjE5MGFkNTVhNjAx
ICJod21vbjogKHBtYnVzL2lzbDY4MTM3KSBhZGQgc3VwcG9ydCBmb3IgUmVuZXNhcw0KICBSQUEy
MjgyNDQgYW5kIFJBQTIyODI0NiINCg0KQm90aCBjb21taXRzIGZvbGxvdyB0aGUgc2FtZSBwYXR0
ZXJuIG9mIGFkZGluZyB0byBlbnVtIGNoaXBzLg0KSSB0aGluayBrZWVwaW5nIHRoZXNlIGVudHJp
ZXMgaW4gZW51bSBjaGlwcyBtYWludGFpbnMgY29kZQ0KY29uc2lzdGVuY3kgYW5kIGRvY3VtZW50
YXRpb24gdmFsdWUuIEhvd2V2ZXIsIGlmIHlvdSBwcmVmZXINCm5vdCB0byBhZGQgdGhlbSB0aGVy
ZSwgSSdtIGhhcHB5IHRvIGFkanVzdCBpbiB2Mi4NCg0KQmVzdCByZWdhcmRzLA0KRGF3ZWkgTGl1
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9l
Y2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNClNlbnQ6IE1vbmRheSwg
TWFyY2ggMTYsIDIwMjYgMTE6NDggUE0NClRvOiBEYXdlaSBMaXUgPGRhd2VpLmxpdS5qeUByZW5l
c2FzLmNvbT4NCkNjOiBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IHJvYmhAa2Vy
bmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBjb3JiZXRA
bHduLm5ldDsgc2toYW5AbGludXhmb3VuZGF0aW9uLm9yZzsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU7IG1hZ251cy5kYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBHcmFudCBQZWx0aWVyIDxn
cmFudC5wZWx0aWVyLmpnQHJlbmVzYXMuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGh3
bW9uL3BtYnVzOiAoaXNsNjgxMzcpIEFkZCBzdXBwb3J0IGZvciBSZW5lc2FzIFJBQTIyODk0MiBh
bmQgUkFBMjI4OTQzDQoNCk9uIE1vbiwgTWFyIDE2LCAyMDI2IGF0IDAxOjM1OjQwUE0gKzA4MDAs
IERhd2VpIExpdSB3cm90ZToNCj4gQm90aCBSQUEyMjg5NDIgYW5kIFJBQTIyODk0MyBhcmUgZGln
aXRhbCBkdWFsLW91dHB1dCAxNi1QaGFzZShYK1kg4omkIA0KPiAxNikgUFdNIGNvbnRyb2xsZXJz
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXdlaSBMaXUgPGRhd2VpLmxpdS5qeUByZW5lc2FzLmNv
bT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2h3bW9uL2lzbDY4MTM3LnJzdCB8IDIwICsrKysr
KysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2h3bW9uL3BtYnVzL2lzbDY4MTM3LmMgICB8ICA2
ICsrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9od21vbi9pc2w2ODEzNy5yc3QgDQo+IGIvRG9jdW1lbnRh
dGlvbi9od21vbi9pc2w2ODEzNy5yc3QNCj4gaW5kZXggZTc3ZjU4MmMyLi4wY2UyMGQwOTEgMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vaHdtb24vaXNsNjgxMzcucnN0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vaHdtb24vaXNsNjgxMzcucnN0DQo+IEBAIC0zOTQsNiArMzk0LDI2IEBAIFN1
cHBvcnRlZCBjaGlwczoNCj4gIA0KPiAgICAgICAgUHJvdmlkZWQgYnkgUmVuZXNhcyB1cG9uIHJl
cXVlc3QgYW5kIE5EQQ0KPiAgDQo+ICsgICogUmVuZXNhcyBSQUEyMjg5NDINCj4gKw0KPiArICAg
IFByZWZpeDogJ3JhYTIyODk0MicNCj4gKw0KPiArICAgIEFkZHJlc3NlcyBzY2FubmVkOiAtDQo+
ICsNCj4gKyAgICBEYXRhc2hlZXQ6DQo+ICsNCj4gKyAgICAgIFByb3ZpZGVkIGJ5IFJlbmVzYXMg
dXBvbiByZXF1ZXN0IGFuZCBOREENCj4gKw0KPiArICAqIFJlbmVzYXMgUkFBMjI4OTQzDQo+ICsN
Cj4gKyAgICBQcmVmaXg6ICdyYWEyMjg5NDMnDQo+ICsNCj4gKyAgICBBZGRyZXNzZXMgc2Nhbm5l
ZDogLQ0KPiArDQo+ICsgICAgRGF0YXNoZWV0Og0KPiArDQo+ICsgICAgICBQcm92aWRlZCBieSBS
ZW5lc2FzIHVwb24gcmVxdWVzdCBhbmQgTkRBDQo+ICsNCj4gICAgKiBSZW5lc2FzIFJBQTIyOTAw
MQ0KPiAgDQo+ICAgICAgUHJlZml4OiAncmFhMjI5MDAxJw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9od21vbi9wbWJ1cy9pc2w2ODEzNy5jIA0KPiBiL2RyaXZlcnMvaHdtb24vcG1idXMvaXNsNjgx
MzcuYyBpbmRleCA3OGNmZjk3MTIuLmRhMjQ4NGQ0MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9o
d21vbi9wbWJ1cy9pc2w2ODEzNy5jDQo+ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvaXNsNjgx
MzcuYw0KPiBAQCAtNjMsNiArNjMsOCBAQCBlbnVtIGNoaXBzIHsNCj4gIAlyYWEyMjgyMjgsDQo+
ICAJcmFhMjI4MjQ0LA0KPiAgCXJhYTIyODI0NiwNCj4gKwlyYWEyMjg5NDIsDQo+ICsJcmFhMjI4
OTQzLA0KDQpBSToNCg0KICBJcyBpdCBuZWNlc3NhcnkgdG8gYWRkIHRoZXNlIGVudHJpZXMgdG8g
ZW51bSBjaGlwcz8NCiAgTG9va2luZyBhdCB0aGUgcmVzdCBvZiB0aGUgZHJpdmVyLCB0aGlzIGVu
dW0gZG9lcyBub3QgYXBwZWFyIHRvIGJlIHVzZWQNCiAgYW55d2hlcmUuIFRoZSBkZXZpY2UgZGF0
YSBtYXBwaW5nIHNlZW1zIHRvIHJlbHkgb24gdGhlIHZhcmlhbnRzIGVudW0NCiAgKGUuZy4sIHJh
YV9kbXB2cjJfMnJhaWxfbm9udGMpIGluc3RlYWQuDQoNCkl0IGhhcyBhIHBvaW50LiANCg0KR3Vl
bnRlcg0KDQo+ICAJcmFhMjI5MDAxLA0KPiAgCXJhYTIyOTAwNCwNCj4gIAlyYWEyMjkxNDEsDQo+
IEBAIC00NzgsNiArNDgwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIHJh
YV9kbXB2cl9pZFtdID0gew0KPiAgCXsicmFhMjI4MjI4IiwgcmFhX2RtcHZyMl8ycmFpbF9ub250
Y30sDQo+ICAJeyJyYWEyMjgyNDQiLCByYWFfZG1wdnIyXzJyYWlsX25vbnRjfSwNCj4gIAl7InJh
YTIyODI0NiIsIHJhYV9kbXB2cjJfMnJhaWxfbm9udGN9LA0KPiArCXsicmFhMjI4OTQyIiwgcmFh
X2RtcHZyMl8ycmFpbF9ub250Y30sDQo+ICsJeyJyYWEyMjg5NDMiLCByYWFfZG1wdnIyXzJyYWls
X25vbnRjfSwNCj4gIAl7InJhYTIyOTAwMSIsIHJhYV9kbXB2cjJfMnJhaWx9LA0KPiAgCXsicmFh
MjI5MDA0IiwgcmFhX2RtcHZyMl8ycmFpbH0sDQo+ICAJeyJyYWEyMjkxNDEiLCByYWFfZG1wdnIy
XzJyYWlsX3BtYnVzfSwgQEAgLTUyOSw2ICs1MzMsOCBAQCBzdGF0aWMgDQo+IGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgaXNsNjgxMzdfb2ZfbWF0Y2hbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxl
ID0gInJlbmVzYXMscmFhMjI4MjI4IiwgLmRhdGEgPSAodm9pZCAqKXJhYV9kbXB2cjJfMnJhaWxf
bm9udGMgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscmFhMjI4MjQ0IiwgLmRhdGEg
PSAodm9pZCAqKXJhYV9kbXB2cjJfMnJhaWxfbm9udGMgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0g
InJlbmVzYXMscmFhMjI4MjQ2IiwgLmRhdGEgPSAodm9pZCANCj4gKilyYWFfZG1wdnIyXzJyYWls
X25vbnRjIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJhYTIyODk0MiIsIC5kYXRh
ID0gKHZvaWQgKilyYWFfZG1wdnIyXzJyYWlsX25vbnRjIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9
ICJyZW5lc2FzLHJhYTIyODk0MyIsIC5kYXRhID0gKHZvaWQgDQo+ICsqKXJhYV9kbXB2cjJfMnJh
aWxfbm9udGMgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscmFhMjI5MDAxIiwgLmRh
dGEgPSAodm9pZCAqKXJhYV9kbXB2cjJfMnJhaWwgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gInJl
bmVzYXMscmFhMjI5MDA0IiwgLmRhdGEgPSAodm9pZCAqKXJhYV9kbXB2cjJfMnJhaWwgfSwNCj4g
IAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscmFhMjI5NjIxIiwgLmRhdGEgPSAodm9pZCANCj4g
KilyYWFfZG1wdnIyXzJyYWlsIH0sDQo=

