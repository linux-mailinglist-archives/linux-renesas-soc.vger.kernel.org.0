Return-Path: <linux-renesas-soc+bounces-31357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPMQL6sQ4mkg1AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 12:51:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FA41A73D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 12:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7053C3004F4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 10:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E7B3750AC;
	Fri, 17 Apr 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c1pvEb5z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96333557D;
	Fri, 17 Apr 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422986; cv=fail; b=EL9wQCZbJSq8doPGexNe2qd2w+zIm70uync1FAcEAgPoosoRv6RrKCMjpN4KttTJgv6oHq/AuPmCpKWd3pYG/cfu4s3RfaDtsOuf1zEtCzj207cLWLEZtQKbnhGWg5dR9zPjeub04r/72nbPIiKCIYV2rOVm/5AcJyz8ixgGbMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422986; c=relaxed/simple;
	bh=5o8zTiNLIQ2mHbJFhhWXyRz4DVHKLSiqeTZPwI5wM8A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tlnw1+9ABye5HYSjmwE+m1lZrGKFd6FHS5fsHjxWW16FZZT0wcB+ma6n4Z+15RVm5INcijqg6je6kqksS3H/22GwJ4Z9ZW5YAisArQcVtF1AJxQNGVagU70DohteN++XZQupmEbGsSoyZo7bfyaEWYB9D6fzi7Xr5QQHOQsD87w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c1pvEb5z; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3OEmBb3oAN2hwg54Al0sY1cu5RCUA316T0xwKbUD6lYRBm44kGrm48UvBreT9d0wfX0prYul74bCpSE/8gb09aBuwSvcUvvBJ95VjqSvixTpFcTgvJDcLF00DoYj81096dneYhYs0tDT0FnSBhl8zWoBCSBe7weniUGXb4VBvxwmH22xOrFsPrWFSowZ2/faqf772HUMT9dLphpCWkEbN0X+zAonpRBKPuEvEx1QbW/fN1MZMLoWxOpayKBUqrv6zEczJJGwdGTx0wmP6e4na7yOGCmHdLOlKQQaq3vlOpXAi3Z0Br5rSZf6Lm4z4dqfRMYb0311W70vU5eF/VDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o8zTiNLIQ2mHbJFhhWXyRz4DVHKLSiqeTZPwI5wM8A=;
 b=KyLfG1kxApKDGIDO1YBabA+5wv0nWVXFaAEcC6tsqRZaQAeW6A+U1Yk/0sBauDXMtMYoh7HScYgKnITKQoYF3EMalywWXaz51QHAl2ZY0JCq1AukzlwmWg9N7YRxuFPNhuhPAwA+yqzNzFnvdguVccP9yK/HTQ1IORwvafuUgkXUBK6juv62Aqblgo2QPINiOuP+UhanTfhyj7ei0gvOeMuVnBbUPEGFhtUoleTG9jqwpp6hTAX8O38lvivDgOo6drmvstfrA6RPFjoWx9dJ4ZgAGqodeLWOCYKAUhD45LWoPBizlNtK2T+Tiu4RW3FW7xLpcaG1NfLAgHYyH+xALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o8zTiNLIQ2mHbJFhhWXyRz4DVHKLSiqeTZPwI5wM8A=;
 b=c1pvEb5z5/CBOxpNtD9kyIIBkn3V/rLGES+2Dga3NQg+CV3N8D6FTGoW+sC6zWDEG8+yEeCqaO9IhN81Ovxauhj6ii2JBhZCq2r9g/g22WIAMfDybtXTHtPmb+U+a/qnpNJXHXXqFHIPmD/zossRVCXy9fQVo55INdJwXAAIipU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14611.jpnprd01.prod.outlook.com (2603:1096:405:235::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 10:49:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 10:49:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, biju.das.au <biju.das.au@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Thread-Topic: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
Thread-Index: AQHczXsqgxiifiqLaUe75nBbRjmUw7XixUyAgABLaIA=
Date: Fri, 17 Apr 2026 10:49:35 +0000
Message-ID:
 <TY3PR01MB11346B5C92803F6A3D174ACCF86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
 <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
In-Reply-To: <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14611:EE_
x-ms-office365-filtering-correlation-id: 99ac444c-b6ce-46f8-054d-08de9c6f03b9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 DfpnhIJyH+i5JKsz89h+0B5H8eUjuV7csipFilw/EiP2ED8o6UfTGREwydSYYsKEtYiz/W4RHbPyXv0Hw14UKJDonH4pimas6WzhPArjpVdf0l2AGgeoyyQSnkjrQEEhqkmYJm+xUZBCrwrhA944QhqUxx9/LzDEpajWpM7HHAjkK8ENY9PtjX4Y8H2FWAvMUr836q0enrqF2U9XqNS4RDA3PZ5IL+s3Mb7iqoitrDiXQeP8Vv/ld4B+Xa0ZWHuFh0TXtSligu7NbuCluzYODyTxhzD7R7sXoGNw7UO15rwbzfpAgvYYKhLPx7W5/VrQdpED1Tktadu2Erdo/5G+nWjAIHfD5CgQy6b09AbWmx3G7Anzy4pjbLuP3j+ICSY3lew7T2J+z88RawSMFxafkmiONUxk7x3NaLZcloAqhTEc2bAt2ljO7GCN47fXEBBcx1ZCdhW/GCh9pupXDAtpgDtQd6iTs8L3PAdmT3mFDw5T0DO+vXfl8xdARlIJY1+Mp2stJc6Nr38hTOlZB0lDgJIqF4kJYhGEwgbDGQhM3Ty0fn0aDpb0QZDP7zrhz8d/FhtsRwcfVImcTokQ6lZvqsJhpyre70svUQoTAeoRUc8qOa+rRFWqyWEecC8++PvvxEa7D6k/qmoG1etYZM1KZtcwu6d+61H92oZ46EDcLU8WwSEzt9YHgYbwR/jVGpRZGvnhuccXcZ34jgO2flexdDE8uquYd8WJJvURaG40T4t7rAqVtwYqza5PRxy0Jv8G8dDPh05GSV3tmRMXdbWr4BJB+Ghe8RRagbgliNuHAodsjNGnAiy6cAz4SVNRtFC3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzZBejlWVEd2anhoTGtFeGJrVjFOVTgrSGZyWUZIbWpUdmJkYmlZcE5jL3pn?=
 =?utf-8?B?eWs4ZHVUa3RMdHhFUGNLM28xdFZZWjNWa3Z4T1RuQ1VNN0o1L20xY2VIaDdG?=
 =?utf-8?B?V2ovL0U1TlN0dWR1aklKaFlOR0ZkZHEyZDNtcGpydStQZ1FzQzhFV1RhUm0v?=
 =?utf-8?B?eDVVazJJUDJSMExkV3JzNFBUK2c3ZUxGZ3VYN0FrckJycTYyTHc1RWtERFFF?=
 =?utf-8?B?QXdSSFphQkgrWnlLQ2JuZGVxUnNWR0ZQTGErSkZXZnp6dS85d0ZMV2lDL0h6?=
 =?utf-8?B?c1pYY1ZEZXZsRlArK2RVT0xZelBKZ2hxOU45b1lxMlNVcStXMFZhM2E3R3dG?=
 =?utf-8?B?QnR3WFpGT1cwWGtSRXp0UFk0RXhUUURBeitILy9JL3lUUFhGdmh2RWdyaDgw?=
 =?utf-8?B?UkxRcWlrdU1PNUtsOER4TmZ3amNaQWJaUzNQU09Na1BHYWc2dGI2VmtXQzlF?=
 =?utf-8?B?SWVGTTQrbFZjdEYrTTRobHRvaGdGQzRKSUpEMkw4NHN0ZjR4Y1FIQzFZOUpw?=
 =?utf-8?B?blJIRkZYRS9sc1BmRlUxU2tKQ3VZTFV4UVU4eURmTXdlM01GNlJjRTdlb1FO?=
 =?utf-8?B?cHp1U3FtR1kreHpNTFpzdmpHNVlwdXFYSFp2bVNwVFN0Z21NYUMwYldKREo0?=
 =?utf-8?B?Y0V1K05QY3l0Tm1JdlVZdDd5aDloSE01Zzl0ZEU3cEtBNWx2ck1sYit3VHpO?=
 =?utf-8?B?R2tzZmtBK0R4b2N6cHdhZ0VQOGdjWmtyT1ZxaGJSZFl3T3pUdTdzRVpQWlZD?=
 =?utf-8?B?cVBUYWt2cmtsRFRULytvOHc2dXJHc3Q5b1pRRE9KSGxnN0k2Y1lWWC9vYWFZ?=
 =?utf-8?B?bXIrS2JWTzNnZ2F5MXM2aVNpTzAxTW1oc1I5cUo2N1ZncEQxS083WkFvNTRP?=
 =?utf-8?B?dm5OVGY2Q0E2WEhZWEY4QTdoZjZEUVBncVV0Nmp4RktDSHZaRmhPSjhRQ2dy?=
 =?utf-8?B?R1p0bGRPMnJpcmQ4UGR4RVdVZVVmSWprVk43S05aSVJOdmhOelEySlVHOVlH?=
 =?utf-8?B?SHF4R1dPV1BOdU16aStWeERFL2VwSDlQd0JybjI3cnlDSnliZHk5emtLeHFp?=
 =?utf-8?B?aFk4aU1YU1ZxcnRxcFBqUkltSTBVSVdqcmtRQ1p3ZXVXZUF0ZWVsa0R1R0FF?=
 =?utf-8?B?SnlNcHVrbWdXT1NYZjRIM2RaYXhsU1lvSWQyZU04bncxeGhTNnh5dzM0Mnhh?=
 =?utf-8?B?UU0wTHFnSUZBUndMcUREdW9uaU1pNVZUaFJkZ3B4cHhod05reWoyYXo2ckNR?=
 =?utf-8?B?eXBGRmRuc2QzTmtWRk1zdDdBWVBkQ0M2MG0ycWROZjJHaW1Bc1B5ZmJkN3dQ?=
 =?utf-8?B?Znl3SXM1bGpVVS82Yk16VlRoRTB4cWdlcHpOeUNnTkp6TnU2eUVDanJPaEQy?=
 =?utf-8?B?bTJVcGY5KzBWWFp6WEdadm41dCtQbzQ3NmhoSDdrQ054RXpVRzJCbFlRRDFS?=
 =?utf-8?B?R3RobzVTVnVqZ1RDd25LSU0vdVpwV1hab2dmWjFndFdMa3JVc2RqU09yMllz?=
 =?utf-8?B?dmxrRnhBNnJxOGFGVWxxVnpLeEt4ZWJpT29vd3hOUlJkeUtleTQyU1lMbStR?=
 =?utf-8?B?Ty9aaVNxL0ZkT1J6cTgzMlI4emJaVmlOVHd6YXJrTXljRTlwZ2U2TzZDRGta?=
 =?utf-8?B?eGdBMFB4K21wS0tPYTJPTHo4djFsazU4V2w1dUxyUDY4c0dPR1MzUzczZ2dl?=
 =?utf-8?B?bmFGSFV1N1hoU2x5anlSOEpVYTl4Z05mRkdGbFEreEtvWXBnNHNnU3BJSVFw?=
 =?utf-8?B?Zzc5MG80K2NjaC9LdFc1b0FiM2Jkc3hxaDJ0dThPaXRMWDlMeVhUN2NidXZs?=
 =?utf-8?B?R1FQMTZHMUo2RzZPbFV5bVpiZEV4emo4bS9BN1REZ2pHMjRNdGJmdUJuWjl6?=
 =?utf-8?B?amFJN1FlZ2wyUzhzbHdUZ2JBVUJHZDM1WXRsVWJwUEJkb2dWNnRyZWRnejRT?=
 =?utf-8?B?VTdHaHlJVUVTOXBpd1oyVkRhbUt4OWgxRjFXOFI0WEsxbFQxZG9zS25tM3c5?=
 =?utf-8?B?Tk9zY2JuWVA5US95VGZwVGZ5enBqSjF5OFpDMW51dHV1YlZqZ2hUTnQzK2hs?=
 =?utf-8?B?TzB2U1E0ZDhWVjRZQkJPcWpVL2kvb3JqTXVWNlZkMUx3cWdtdDVPSmw0UkNn?=
 =?utf-8?B?Y3ArNE5tRmZSY20rRUJObWYwVktJQUo1SFN5U2hxaWtTaWNrK2tncUFYd1B5?=
 =?utf-8?B?cHhhbUlRTmFqb2UzSEZhdEdMMy8raWtQSXc2MDRMdmhMRVozeTQ3V2pJNUdw?=
 =?utf-8?B?U1JxdmhLV3VxVzhHbEhQTnE1VHNna1ZTZmFyK29sdVJpaDMvT29acU5PeHVk?=
 =?utf-8?B?OVBMTmRqSE94RFFHZDczOHpsRHl4SndKc2pxenRib0lxTFlBdTlSZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ac444c-b6ce-46f8-054d-08de9c6f03b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 10:49:35.0918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poT9xYMKHrWKHb6DxbaDDVU0u3qgcY4hWp1A2JWrwE8vd+NT2p8Tl5tKSnGwvZ4k5Q/e86VqmTDjwrGkkp1Xz652qMrIDkakmzEse7znu8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14611
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31357-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,smarc-rzg3l:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,bp.renesas.com:dkim,aka.ms:url,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 160FA41A73D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGl1IFlpbmcsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4N
Cj4gU2VudDogMTcgQXByaWwgMjAyNiAwNzowNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBk
cm0vYnJpZGdlOiBpdGUtaXQ2MjYzOiBBZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydA0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgQXByIDE2LCAyMDI2IGF0IDA5OjI5OjI1QU0gKzAxMDAs
IEJpanUgd3JvdGU6DQo+ID4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBiaWp1LmRh
cy5hdUBnbWFpbC5jb20uIExlYXJuIHdoeSB0aGlzDQo+ID4gaXMgaW1wb3J0YW50IGF0IGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+ID4NCj4gPiBGcm9t
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBPbiB0aGUg
UlovRzNMIFNNQVJDIEVWSyB1c2luZyBQU0NJLCBzdXNwZW5kIHRvIFJBTSBwb3dlcnMgZG93biB0
aGUgSVRFDQo+ID4gSVQ2MjYzIGNoaXAuIFRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgZHJpdmVyJ3Mg
c3lzdGVtIFBNIGNhbGxiYWNrcw0KPiA+IGludm9rZSBkcm1fbW9kZV9jb25maWdfaGVscGVyX3tz
dXNwZW5kLHJlc3VtZX0sIHdoaWNoIGluIHR1cm4gY2FsbCB0aGUNCj4gPiBicmlkZ2UncyBhdG9t
aWNfe2Rpc2FibGUsZW5hYmxlfSBjYWxsYmFja3MgY2FuIGhhbmRsZSBzdXNwZW5kL3Jlc3VtZQ0K
PiA+IGZvciB0aGUgYnJpZGdlIHdpdGhvdXQgZGVkaWNhdGVkIFBNIG9wcy4NCj4gPg0KPiA+IElu
dHJvZHVjZSBpdDYyNjNfYnJpZGdlX2luaXQoKSBhbmQgaXQ2MjYzX2JyaWRnZV91bmluaXQoKSBo
ZWxwZXJzIHRvDQo+ID4gY29uc29saWRhdGUgcG93ZXIgc2VxdWVuY2luZywgaGFyZHdhcmUgcmVz
ZXQsIEkyQyBhZGRyZXNzIHNldHVwLCBhbmQNCj4gPiBMVkRTL0hETUkgY29uZmlndXJhdGlvbi4g
VGhlc2UgcmVwbGFjZSB0aGUgb3Blbi1jb2RlZCBpbml0IHNlcXVlbmNlIGluDQo+ID4gcHJvYmUo
KSBhbmQgYXJlIGhvb2tlZCBpbnRvIGF0b21pY19lbmFibGUvYXRvbWljX2Rpc2FibGUgcmVzcGVj
dGl2ZWx5LA0KPiA+IGd1YXJkZWQgYnkgYSBwb3dlcmVkIGZsYWcgdG8gYXZvaWQgcmVkdW5kYW50
IHJlLWluaXRpYWxpc2F0aW9uLg0KPiA+DQo+ID4gU3dpdGNoIGZyb20gZGV2bV9yZWd1bGF0b3Jf
YnVsa19nZXRfZW5hYmxlKCkgdG8NCj4gPiBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldCgpIHNvIHRo
YXQgcmVndWxhdG9ycyBjYW4gYmUgZXhwbGljaXRseSBlbmFibGVkDQo+ID4gYW5kIGRpc2FibGVk
IGFjcm9zcyBwb3dlciBjeWNsZXMuIE1vdmUgcmVzZXRfZ3BpbyBhbmQgcmVndWxhdG9yIHN0YXRl
DQo+ID4gaW50byB0aGUgaXQ2MjYzIHN0cnVjdCBzbyB0aGV5IGFyZSBhY2Nlc3NpYmxlIGJleW9u
ZCBwcm9iZSB0aW1lLg0KPiA+DQo+ID4gQWRkIGEgcmVtb3ZlKCkgY2FsbGJhY2sgdG8gY2xlYW5s
eSBwb3dlciBkb3duIHRoZSBicmlkZ2Ugb24gZHJpdmVyDQo+ID4gdW5iaW5kIHZpYSBpdDYyNjNf
YnJpZGdlX3VuaW5pdCgpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBEcm9w
cGVkIHN5c3RlbSBQTSBjYWxsYmFja3MgaW5zdGVhZCB1c2luZyBicmlkZ2Uncw0KPiA+ICAgIGF0
b21pY197ZGlzYWJsZSxlbmFibGV9IGNhbGxiYWNrcyB0byBoYW5kbGUgc3VzcGVuZC9yZXN1bWUu
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjI2My5jIHwgODgN
Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NzMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiAic3VzcGVuZC9yZXN1bWUi
IGluIHN1YmplY3QgbWFrZXMgcGVvcGxlIHRoaW5rIHRoYXQgdGhpcyBwYXRjaCBwcm9iYWJseSBh
ZGRzIHJ1bnRpbWUgUE0gb3Igc3lzdGVtIFBNDQo+IHN1cHBvcnQuICBUbyBhdm9pZCB0aGlzLCBj
YW4geW91IGNoYW5nZSB0aGUgc3ViamVjdCB0byBzb21ldGhpbmcgbGlrZToNCj4gImRybS9icmlk
Z2U6IGl0ZS1pdDYyNjM6IFN1cHBvcnQgcG93ZXIgY3ljbGUgaW4gcnVudGltZSINCj4gPw0KPiAN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDYyNjMu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2MjYzLmMNCj4gPiBpbmRleCA0
ZjNlYmI3YWY0ZDQuLjE5NTRiYjExZjdmNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2l0ZS1pdDYyNjMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
aXRlLWl0NjI2My5jDQo+ID4gQEAgLTIwMCw5ICsyMDAsMTMgQEAgc3RydWN0IGl0NjI2MyB7DQo+
ID4gICAgICAgICBzdHJ1Y3QgcmVnbWFwICpsdmRzX3JlZ21hcDsNCj4gPiAgICAgICAgIHN0cnVj
dCBkcm1fYnJpZGdlIGJyaWRnZTsNCj4gPiAgICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0
X2JyaWRnZTsNCj4gPiArICAgICAgIHN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87DQo+ID4g
KyAgICAgICBzdHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSAqc3VwcGxpZXM7DQo+IA0KPiBJIHdv
dWxkIG1vdmUgaXQ2MjYzX3N1cHBsaWVzW10gb24gdG9wIG9mIHN0cnVjdCBpdDYyNjMgZGVmaW5p
dGlvbiBhbmQgdXNlICdzdHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YQ0KPiBzdXBwbGllc1tBUlJB
WV9TSVpFKGl0NjI2M19zdXBwbGllcyldOycgaGVyZSwgc28gdGhhdCB5b3UgbWF5IGRyb3AgZGV2
bV9rY2FsbG9jKCkgZm9yIHRoZSBzdXBwbGllcw0KPiBhcnJheSBpbiBwcm9iZS4NCg0KT0suIEdv
b2QgcG9pbnQuDQoNCj4gDQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbnVtX3N1cHBsaWVzOw0K
PiANCj4gVGhlIGFib3ZlIG5ldyBzdXBwbGllcyBhcnJheSBoYXMgYSBrbm93biBzaXplLCBzbyB0
aGlzIGNhbiBiZSBkcm9wcGVkIGFuZCB5b3UgbWF5IGdldCB0aGUgbnVtYmVyIG9mDQo+IHN1cHBs
aWVzIHZpYSBBUlJBWV9TSVpFKGl0LT5zdXBwbGllcykuDQoNCkFncmVlZC4NCg0KPiANCj4gPiAg
ICAgICAgIGludCBsdmRzX2RhdGFfbWFwcGluZzsNCj4gPiAgICAgICAgIGJvb2wgbHZkc19kdWFs
X2xpbms7DQo+ID4gICAgICAgICBib29sIGx2ZHNfbGluazEyX3N3YXA7DQo+ID4gKyAgICAgICBi
b29sIHBvd2VyZWQ7DQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgaXQ2
MjYzICpicmlkZ2VfdG9faXQ2MjYzKHN0cnVjdCBkcm1fYnJpZGdlDQo+ID4gKmJyaWRnZSkgQEAg
LTU3OCw2ICs1ODIsNDEgQEAgc3RhdGljIGludCBpdDYyNjNfcmVhZF9lZGlkKHZvaWQgKmRhdGEs
IHU4ICpidWYsIHVuc2lnbmVkIGludCBibG9jaywNCj4gc2l6ZV90IGxlbikNCj4gPiAgICAgICAg
IHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCBpdDYyNjNfYnJpZGdlX2lu
aXQoc3RydWN0IGl0NjI2MyAqaXQpIHsNCj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0ID0gcmVndWxhdG9yX2J1bGtfZW5hYmxlKGl0LT5udW1fc3VwcGxpZXMsIGl0
LT5zdXBwbGllcyk7DQo+ID4gKyAgICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICAg
IGRldl9lcnIoaXQtPmRldiwgImZhaWxlZCB0byBlbmFibGUgcG93ZXIgc3VwcGxpZXNcbiIpOw0K
PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4g
PiArICAgICAgIGl0NjI2M19od19yZXNldChpdC0+cmVzZXRfZ3Bpbyk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgcmV0ID0gaXQ2MjYzX2x2ZHNfc2V0X2kyY19hZGRyKGl0KTsNCj4gPiArICAgICAgIGlm
IChyZXQpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihpdC0+ZGV2LCAiZmFpbGVkIHRv
IHNldCBJMkMgYWRkclxuIik7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvcl9idWxrX2Rp
c2FibGUoaXQtPm51bV9zdXBwbGllcywNCj4gPiArIGl0LT5zdXBwbGllcyk7DQo+IA0KPiBJIGtu
b3cgdGhhdCB5b3UgY2FsbCBpdDYyNjNfYnJpZGdlX2luaXQoKSBpbiBwcm9iZSwgcHJvYmFibHkg
YmVjYXVzZSB5b3Ugd2FudCB0byBlbmFibGUgdGhlIHJlZ3VsYXRvcnMNCj4gZm9yIGhvdHBsdWcg
ZGV0ZWN0IGFmdGVyIHByb2JlKGl0NjI2M19kZXRlY3QoKSByZWFkcyByZWdpc3RlciBIRE1JX1JF
R19TWVNfU1RBVFVTIHRvIGRvIHRoZSBkZXRlY3Rpb24pLg0KPiBIb3dldmVyLCBhbiBpZGVhWzFd
IGlzIHRvIHdyYXAgdGhlIHJlZ2lzdGVyIHJlYWQgb3BlcmF0aW9uIHdpdGggcmVndWxhdG9yX2J1
bGtfZW5hYmxlKCkgYW5kDQo+IHJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoKSBpbiBpdDYyNjNfZGV0
ZWN0KCkgc28gdGhhdCB5b3UgbWF5IGRyb3ANCj4gaXQ2MjYzX2JyaWRnZV9pbml0KCkgZnJvbSBw
cm9iZS4gIFdpdGggdGhhdCwgIGl0NjI2M19icmlkZ2VfaW5pdCgpIGlzIG5vdyBvbmx5IGNhbGxl
ZCBmcm9tDQo+IGF0b21pY19lbmFibGUsIHdoaWNoIG1lYW5zIHRoYXQgdGhlIGluaXRpYWxpemF0
aW9uIGNvZGUgY2FuIGJlIG9wZW4tY29kZWQgYW5kIHRoZSBpbml0aWFsaXphdGlvbiBpcw0KPiBz
dXBwb3NlZCB0byBiZSBzdWNjZXNzZnVsKGR1ZSB0byB0aGUgImF0b21pYyIgbmF0dXJlKSBoZW5j
ZSBubyBuZWVkIHRvIGRvIHRoZSByZWd1bGF0b3IgZGlzYWJsZW1lbnQNCj4gYmFpbG91dChlcnJv
ciBtZXNzYWdlIGluIGRtZXNnIGlzIHN1ZmZpY2llbnQpLg0KDQppdDYyNjNfZGV0ZWN0KCkgc3Rp
bGwgd29ya3Mgd2l0aCByZWd1bGF0b3JfZGlzYWJsZSgpLCBzZWUgdGhlIGxvZ3MgYmVsb3cuDQoN
Cg0KPiANCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAgIH0NCj4g
PiArDQo+ID4gKyAgICAgICBpdDYyNjNfbHZkc19jb25maWcoaXQpOw0KPiA+ICsgICAgICAgaXQ2
MjYzX2hkbWlfY29uZmlnKGl0KTsNCj4gPiArDQo+ID4gKyAgICAgICBpdC0+cG93ZXJlZCA9IHRy
dWU7DQo+IA0KPiBJZiB5b3UgZHJvcCBpdDYyNjNfYnJpZGdlX2luaXQoKSBmcm9tIHByb2JlLCBJ
IHRoaW5rICdwb3dlcmVkJyBmbGFnIGNhbiBiZSBkcm9wcGVkIHRvby4NCj4gDQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgaXQ2MjYz
X2JyaWRnZV91bmluaXQoc3RydWN0IGl0NjI2MyAqaXQpIHsNCj4gPiArICAgICAgIHJlZ3VsYXRv
cl9idWxrX2Rpc2FibGUoaXQtPm51bV9zdXBwbGllcywgaXQtPnN1cHBsaWVzKTsNCj4gPiArICAg
ICAgIGl0LT5wb3dlcmVkID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIDA7DQo+
ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIGl0NjI2M19icmlkZ2VfYXRvbWljX2Rpc2Fi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlDQo+ID4gKnN0YXRlKSAg
eyBAQCAtNTg3LDYgKzYyNiw4IEBAIHN0YXRpYyB2b2lkDQo+ID4gaXQ2MjYzX2JyaWRnZV9hdG9t
aWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiA+ICAgICAgICAgcmVnbWFw
X3dyaXRlKGl0LT5oZG1pX3JlZ21hcCwgSERNSV9SRUdfUEtUX0dFTkVSQUxfQ1RSTCwgMCk7DQo+
ID4gICAgICAgICByZWdtYXBfd3JpdGUoaXQtPmhkbWlfcmVnbWFwLCBIRE1JX1JFR19BRkVfRFJW
X0NUUkwsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgQUZFX0RSVl9SU1QgfCBBRkVfRFJWX1BX
RCk7DQo+ID4gKw0KPiA+ICsgICAgICAgaXQ2MjYzX2JyaWRnZV91bmluaXQoaXQpOw0KPiANCj4g
V2VsbCwgdGhpcyBjb3VsZCBlZmZlY3RpdmVseSBkaXNhYmxlIHRoZSByZWd1bGF0b3JzIGFuZCBo
b3RwbHVnIGRldGVjdGlvbg0KPiB3b24ndCB3b3JrIHRoZW4uICAgU28sIGFnYWluLCB0aGUgYWJv
dmUgaWRlYVsxXSBoZWxwcy4NCg0KSXMgaXQgbm90IHdvcmtpbmcgb24geW91ciBzZXR1cD8gSXQg
d29ya3MgZm9yIG1lLg0KDQoNCnJvb3RAc21hcmMtcnpnM2w6fiMgWyAgIDMzLjUxMjYxOF0gIyMj
I2l0NjI2M19kZXRlY3QjIyMjDQpbICAgNDQuMDA4NjIxXSAjIyMjaXQ2MjYzX2RldGVjdCMjIyMN
ClsgICA1NC41MDQ2MjNdICMjIyNpdDYyNjNfZGV0ZWN0IyMjIw0KWyAgIDY1LjAwMDYwMl0gIyMj
I2l0NjI2M19kZXRlY3QjIyMjDQpbICAgNjUuMjI3NzQzXSAjIyMjaXQ2MjYzX2RldGVjdCMjIyMN
ClsgICA2NS4yMzMzMjJdICMjIyNpdDYyNjNfYnJpZGdlX2F0b21pY19kaXNhYmxlIyMjIw0KWyAg
IDc1LjI0MDYzN10gIyMjI2l0NjI2M19kZXRlY3QjIyMjDQpbICAgODUuNDgwNjI4XSAjIyMjaXQ2
MjYzX2RldGVjdCMjIyMNClsgICA5NS43MjA2NjJdICMjIyNpdDYyNjNfZGV0ZWN0IyMjIw0KWyAg
MTA1Ljk2MDY0MF0gIyMjI2l0NjI2M19kZXRlY3QjIyMjDQpbICAxMTYuMjAwNjQ3XSAjIyMjaXQ2
MjYzX2RldGVjdCMjIyMNClsgIDEyNi40NDA2MzVdICMjIyNpdDYyNjNfZGV0ZWN0IyMjIw0KWyAg
MTI3LjA0ODk4MV0gIyMjI2l0NjI2M19kZXRlY3QjIyMjDQpbICAxMjcuNTE3OTYyXSAjIyMjaXQ2
MjYzX2JyaWRnZV9hdG9taWNfZW5hYmxlIyMjIw0KDQo+IA0KPiA+ICB9DQo+ID4NCj4gPiAgc3Rh
dGljIHZvaWQgaXQ2MjYzX2JyaWRnZV9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsIEBADQo+ID4gLTYwMyw2ICs2NDQsOSBAQCBzdGF0aWMgdm9pZCBpdDYyNjNfYnJpZGdl
X2F0b21pY19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gPiAgICAgICAgIGJv
b2wgcGNsa19oaWdoOw0KPiA+ICAgICAgICAgaW50IGksIHJldDsNCj4gPg0KPiA+ICsgICAgICAg
aWYgKCFpdC0+cG93ZXJlZCkNCj4gPiArICAgICAgICAgICAgICAgaXQ2MjYzX2JyaWRnZV9pbml0
KGl0KTsNCj4gPiArDQo+ID4gICAgICAgICBjb25uZWN0b3IgPSBkcm1fYXRvbWljX2dldF9uZXdf
Y29ubmVjdG9yX2Zvcl9lbmNvZGVyKHN0YXRlLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmlkZ2UtPmVuY29kZXIpOw0K
PiA+ICAgICAgICAgY3J0YyA9IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3Jfc3RhdGUoc3Rh
dGUsDQo+ID4gY29ubmVjdG9yKS0+Y3J0YzsgQEAgLTg0MCw3ICs4ODQsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0DQo+ID4gZHJtX2JyaWRnZV9mdW5jcyBpdDYyNjNfYnJpZGdlX2Z1bmNzID0geyAg
c3RhdGljIGludA0KPiA+IGl0NjI2M19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KSAg
ew0KPiA+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2Ow0KPiA+IC0g
ICAgICAgc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsNCj4gPiAgICAgICAgIHN0cnVjdCBp
dDYyNjMgKml0Ow0KPiA+ICAgICAgICAgaW50IHJldDsNCj4gPg0KPiA+IEBAIC04NTgsMTMgKzkw
MSwyMSBAQCBzdGF0aWMgaW50IGl0NjI2M19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
KQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIo
aXQtPmhkbWlfcmVnbWFwKSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImZhaWxlZCB0byBpbml0IEkyQyByZWdtYXAgZm9yDQo+ID4gSERNSVxuIik7DQo+ID4NCj4g
PiAtICAgICAgIHJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJyZXNl
dCIsIEdQSU9EX09VVF9MT1cpOw0KPiA+IC0gICAgICAgaWYgKElTX0VSUihyZXNldF9ncGlvKSkN
Cj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJl
c2V0X2dwaW8pLA0KPiA+ICsgICAgICAgaXQtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9v
cHRpb25hbChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9MT1cpOw0KPiA+ICsgICAgICAgaWYgKElT
X0VSUihpdC0+cmVzZXRfZ3BpbykpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgUFRSX0VSUihpdC0+cmVzZXRfZ3BpbyksDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IHJlc2V0IGdwaW9cbiIpOw0KPiA+
DQo+ID4gLSAgICAgICByZXQgPSBkZXZtX3JlZ3VsYXRvcl9idWxrX2dldF9lbmFibGUoZGV2LCBB
UlJBWV9TSVpFKGl0NjI2M19zdXBwbGllcyksDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaXQ2MjYzX3N1cHBsaWVzKTsNCj4gPiArICAgICAgIGl0LT5u
dW1fc3VwcGxpZXMgPSBBUlJBWV9TSVpFKGl0NjI2M19zdXBwbGllcyk7DQo+ID4gKyAgICAgICBp
dC0+c3VwcGxpZXMgPSBkZXZtX2tjYWxsb2MoZGV2LCBpdC0+bnVtX3N1cHBsaWVzLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZigqaXQtPnN1cHBsaWVzKSwg
R0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAoIWl0LT5zdXBwbGllcykNCj4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yICh1bnNpZ25l
ZCBpbnQgaSA9IDA7IGkgPCBpdC0+bnVtX3N1cHBsaWVzOyBpKyspDQo+IA0KPiBOaXQ6IEkgd291
bGQgZGVmaW5lIGkgdG9nZXRoZXIgd2l0aCB0aGUgb3RoZXIgbG9jYWwgdmFyaWFibGVzIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgdGhpcyBmdW5jdGlvbi4NCg0KImkiIGlzIHVzZWQgaGVyZSBvbmx5LiBG
b3IgbWUgaXQgaXMgYmV0dGVyIHRoYW4gcHV0dGluZyBhdCB0aGUgdG9wLg0KDQpJIGdvdCBmZWVk
YmFjayBmcm9tIG90aGVyIHN1YnN5c3RlbSBtYWludGFpbmVyIHRvIHVzZSB1bnNpZ25lZCBoZXJl
DQphcyB0aGUgc2NvcGUgaXMgd2l0aGluIGZvciBsb29wLg0KDQpDaGVlcnMsDQpCaWp1DQo=

