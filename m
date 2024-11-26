Return-Path: <linux-renesas-soc+bounces-10710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B279D98B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 14:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86CDFB21A1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 13:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3921B87C2;
	Tue, 26 Nov 2024 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="loGPZGS+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40459DDCD;
	Tue, 26 Nov 2024 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732628673; cv=fail; b=h86p1zNr7VmliybWFRm/8dHw/AAFDmSL3MqtFpDIycTZBp+/QkKolrYj9LwQji5GH5aDmmnU/azU4szMdIw/RhA9x86xUHvH4g2tS4fqReTmV3hYDI91rf/n1OeiEOXb7Kwi2bVeqbmsfGZ2qk/vjMIsoMv5Ji/CqIaO1UJX5OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732628673; c=relaxed/simple;
	bh=Fh/4vg+T8zSjb8OH0aSFXpOnkbMIucLfa33uQn4vITE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U7m8hfOaVDEomJXOahDxXaLv7/PUu7R8UaqSgZgb91Z8Juv2n6gUpzPZjIx933xD57KS08PScJDkxTZT1dQycF4hJJkCzg2XCMx0GyJKUHopFDVRKBB+NBdJ3uJpHvpu8VNY+hghcnViMPJGHt7sjmqYaKcDMbJ0cmXISbk2svk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=loGPZGS+; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFruQ+taePBirT3Fv6TaoIomyrBeW9xnu1XLRXSg0bAsNi9yTrSP5WPq37dq7VXUfGAewhlMBiTgHtcnOkrYdqA2Nlx2yNSseE9OsZHE+uKgBFRb2attNqzYnEbo2G9wKj67Q4pc5vC1W3HJfaYJfqOG7ASn+sP43ehc10bPiJ5z3E4ZZ0w6P06z0f6fiQLm+5otSslqT9kjJJGqZtW+fH6bl1uf2mR5pn3qETGtT+nCUT34hlV5CUh5baU5fW5Od6AKTSKFQkd27eWLzOj+eEQYcAfhypOQxMAEqWXDzlpsdxJ4/S4dit/18TIxKIFEeGodKw3tccGadfNQAzK04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh/4vg+T8zSjb8OH0aSFXpOnkbMIucLfa33uQn4vITE=;
 b=l8bffJo8QNDo+HQBP3Fp8s7q1aGVIubodMclgbBcoVbqmsFUy3roO9mqycnpPmjaRWcPSk8ll+EKLLABLNnLKm/2Lngfo5omFGjwAMJkbyXNgv9MLd2NyYb474hHoyufq3MhkXuR3lvxnA56u9teW4MzUYPnYbHRQ0h1ktSh4lzdsBayr5hvcW9twVJCVTfGHbBP1eVaoKs85ndJvhL/Lx5SbqFbV5vGQLnjoxmyKs5BxSKhIjjdFcj4MNpPcQ9bv70Dg5UB3W0GrI+kEWYlGyAoAVW0+B4VL1rVmnRuH47Cpdpkxskp8YOnztumm4K85MXrlEjyNOnwvPqm+tAajQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh/4vg+T8zSjb8OH0aSFXpOnkbMIucLfa33uQn4vITE=;
 b=loGPZGS+bgV0ZLJczsWb38YkXSnP1a/hx2A1KeU8yu4c67A6ifw0PSTzf9hUmHJ5y+COvXmSzDksVz+djIg+lBGlugbPNDEJwwAEbaZobSrR3o3AncXJVRN3CCTT1WyvgiA9MZiuHWYpMfDCI+Xx+Pp01GZA6nmG8XvNPDF7E8w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8000.jpnprd01.prod.outlook.com (2603:1096:400:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 13:44:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 13:44:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "kishon@kernel.org" <kishon@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ
 family
Thread-Topic: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ
 family
Thread-Index: AQHbP+SZef71s6SoPkyzSsFLPei/obLJSsNQgABHZQCAAACCMA==
Date: Tue, 26 Nov 2024 13:44:25 +0000
Message-ID:
 <TY3PR01MB11346A26DECCFBD41B83131D0862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346C9A56B483666575EB23A862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVkXo=HSqoF2hur8Nvder6yOg_Aqgzq=aFvfti+9=PnJA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVkXo=HSqoF2hur8Nvder6yOg_Aqgzq=aFvfti+9=PnJA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8000:EE_
x-ms-office365-filtering-correlation-id: 2cb817f8-edf5-4a67-5be1-08dd0e2070fe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UENpVlhDY01XV294Z3p2eXJ0ay85cmJnYVU4YXVabndybmlVVm4wOVI3Vytl?=
 =?utf-8?B?RWJpUjVwNFFrblBVZjc5dkNEMmhGd1ZxajFyNGZoaE9HNzZPckwwbVZESHFk?=
 =?utf-8?B?Ujlpem4rNUFwazZjOW1nMU05aXpTR29WbjhqOHZwVjJLaUtFMjZWOTE2d2ov?=
 =?utf-8?B?Q2RCck9hSUp6M1h5Z3JpdE5kZlVhaUFIWG9tZUpLdjFHMlNlWXgyVjVmZmJz?=
 =?utf-8?B?NkNUUkZScFZjUWlKN0xGM29VVUJNQU9USVlsa3hSZXF1OFBOcmhVYUpLWVhH?=
 =?utf-8?B?dVRVMXNhQ3BWU3orbWVBU1RWVnhxSVROMWdpRXk0WVpJelcweHRDbEVQa1Rj?=
 =?utf-8?B?SFgxZmVqb3h3OTRhbnpyMjJyL1ZiZzVtUkNBckp0MitSRTcrbXNHYmJYVUNE?=
 =?utf-8?B?c2ZId1BZejRKdmR4emVHcnVUZ3l3R2lKbzZVRDJ4aUsybjlWMXVQdGIyWlU0?=
 =?utf-8?B?alNMYmt0bVVETUlnYk5PclhQQmZJclU5V1BxeTNYanhvT3BCK28zeXV4STIv?=
 =?utf-8?B?SmFHZFVFdllzdDJuNCtUWWtJUUFWWm5IN08vWW5xclIwZ0xnbDhNcnlQYmJC?=
 =?utf-8?B?dHVQd3plelB5Q25Pd3ZvVDZhVlREQ1JyNTdIeXhXQ2YwSEQvUmtOcFRBUDlV?=
 =?utf-8?B?Uk81em9XMzFrMzBPWkZzeWpYWEtlWFhIQ1RjaHJld3Z5SVh2RkhmR1hwcldu?=
 =?utf-8?B?QjhacFZudlpwaTlVWG1rMW5NdG81SmRLMzBkZkNSbUdIbTZ0S2JZb09wdXRV?=
 =?utf-8?B?a0lvQ0JFSXFmeWNNRXRDSVB3dkw5S0RmcmJ5QVhZV3d1RXM3djJYMVJwMEhX?=
 =?utf-8?B?VXBlSDM1NGdjTE1TTlQ5Q1d2WlJhL3c1UjlFUlBXeHZKSDgyZzBJbUo2bSt6?=
 =?utf-8?B?K1N0RDZqU0QzVTZ1UE55VllHUS9QQWNWN2FJekRiS3hMUmVnSVkzR20zRG01?=
 =?utf-8?B?YUFmM3JkdkhoeEd5YTVubWlwYlJoTE9iZnJCWGI0R2lRc1VEZlZXNUhQOVNH?=
 =?utf-8?B?UnIrdmxONkhUaUNkMFVQc1hQYWxRSVVJRjhNYmpLOXM1YjFDQTFudGtVZlli?=
 =?utf-8?B?NnpPQmF4WHlSdXF2OUtZTXNlN0QvOGhiQXNjZENudU1kaHZxZExTdGVuaTMy?=
 =?utf-8?B?NFlyYUxZdFpSbUl4YmNNZ2pjRE1jbkNLY1YyQmVoRlQvWDR4enVMRmR2T0FW?=
 =?utf-8?B?Z1FmWDFjQSt3TEVXYU1IbzVENHVEVnBnTGE3ZXJoRStGcVdXU3JUM05OejVs?=
 =?utf-8?B?dUhUallwUVJMeFg1UC9JSU1SMjhpQXM4OGdQaU42TFFhUTd6azFzY2ZsZHdr?=
 =?utf-8?B?VWp1MFZnWEtiYTdzQXQvajR6bVhCZUF4QW5qemlFQklrWHJxaUtpRUkxbkNx?=
 =?utf-8?B?Qis0YjJGdHR2WW1teVRHcWh5Z1BjZisrVzY1am5qWUNMOWMzVTNtYkgwYjZk?=
 =?utf-8?B?dFNySG1Sek83MHhUY2hwU3RZS2ZoMXhQSXpDREJUV1F2elRxdTNNR0xKZkk0?=
 =?utf-8?B?OFRkMExXNVBtYjM5aHpqelo0Z216TXJhRU1LVzFzTHkyRmZSa1IxQVhwb2dx?=
 =?utf-8?B?a2c4THRSaEFwMTAvYVQ1djl0d21RVXo2WFg3RTkxTld6b1BxTWNtcU41Sm44?=
 =?utf-8?B?ZkRxeVk2ZmRocGR3Q29sc29aQmNCandpZmZXMVg0eEtxY09XMTRndFh6Rkcy?=
 =?utf-8?B?YnpmYjVKbittZklxYStFQ1hvK09HbTR4QkZtVGxIekhWbllWN1FBM3RycERH?=
 =?utf-8?B?dW1yQVJYVUhFanJGYU1zbHVRbkdZSG1tQTJEVXhYRG9sUXRQZ0lUb0JZREVE?=
 =?utf-8?B?VkFoV0VkNE94azlrTExoajFvTXdwUEdmRmMvTVYyU2lkRE5rNEdMZ1B0bHpX?=
 =?utf-8?B?UjNkMDQ3RVNzQmFKQTBDeWZUSmY2MDJaNUVNWjY5OUNkTEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vmp6QXJCVm9wWWg1OFdMMWRZSVZZbmZCZUg0T2VMQ0RwRU1YRnJUNkE4VDhL?=
 =?utf-8?B?ZzhGWFNaQ28zZkF3QUM5Tmh5MHJnaE1MVWpxM0RwL0VUbUhoMWNjQmZCK3VU?=
 =?utf-8?B?NVE3Ym1EU3lFNVJTNXpQdkFQRVVNU2c2UUlQd3o4TUhheTJEdlplSklCbDBm?=
 =?utf-8?B?alMvUGFFczFvNEs2MWJwWVJvYXJWczJQRzZZTnZJMkRpSUZNcmc0U2RDMnFw?=
 =?utf-8?B?ZEZZYkhVeFNhZUFsblZwajJibyttenhlQy9MOE1OYWN1NEtOdHlZRng4V2tE?=
 =?utf-8?B?eEZ6bEU4Y1BTV1B3NHF2MnpES1cwWndDU3Y4dE1FVXRoUW9mVjhTTmk5VTUz?=
 =?utf-8?B?T1RXaVY2dmRFS1BCUzhGWHJWdkEvVElDcE03NDA0aHM0U1c3NEVCQ2tNajVV?=
 =?utf-8?B?dmQzUzk5Ym5GZXIrU0hxRWVKVTI4QkpFU3VyS0thRFBpWVh2ZnllanYvMVpw?=
 =?utf-8?B?NGFacDB6bzdtalZQZVU3bk0yOEJwWGM5Q0dudmQ4WTJYTG5LL3FWdWkrcDZD?=
 =?utf-8?B?eDdXbERIZVh5cEFxSDYvRkd3STg4OWg0K3FCaXJzbjFhL0prdDdVZndUb3NS?=
 =?utf-8?B?UGJWRmo0cDZVWUw3ZC9FczJ4MzlmeG5NNlJWMlRPUkdOMGFSN3J4UnNLZ3Zi?=
 =?utf-8?B?VlgzSzgxY1kxWkd2VStUUUxoTnI1b1QvY01DNVhoTGJ0WGFxSXUyOERGdjhG?=
 =?utf-8?B?dzNuWm5aY2JGM0hlY3RJVHEvRU9XTHRUOVIzcDEvNDl4QVQreVArWmN2WFZn?=
 =?utf-8?B?UndRcFdYNUZUOE56elZ1c0hqQ1FzeWlkVjZsU0kxb3dtM3Q5ZWVnV2pmYWNX?=
 =?utf-8?B?bXVyTGhTVVF6RFkvM1VDbDNpOEdsUkxDMllPTnlvZmliQVZxM0h3c0pMR292?=
 =?utf-8?B?elR6R1FkSC9idUJzK1RTWG5SQVk0TDRDRWs1bnJMcnoxS0k5aWM0SjVCc2Fz?=
 =?utf-8?B?NkhNZnZPbEZUajFrSzdDa3VkOHUwR0l1TERhcE92K3VoTmxaVXVXbXpqeGxK?=
 =?utf-8?B?dnlsV2tVa21oRExqMjJvdFQvb2ZKM2hKcXZwVmFaK3Eva2RRNmpBUHBFNUxK?=
 =?utf-8?B?RTJUMjQ5NXA1TGNNc3JnSkJZRnZwMk16R1JjcFpVWjBySTV5M3lRZk81UDJx?=
 =?utf-8?B?SnNHZ3VhdTNTUFhpb21pQUdVMjlpR3dmYTJWK1lNSmt3L01jLzZ3bU5UamU3?=
 =?utf-8?B?Q3o5MERuamthaEFqcWNQR1NXekFtWFpnQ2RtYnBKcmg2d3JFU1JoV0wxRmZ6?=
 =?utf-8?B?Y09sd1NmUEtPR0RTYU9aeVBIQlpXcXBPZ3EydHNjMFNzUzg2UU04dXpMZUkz?=
 =?utf-8?B?SmhZV0twRVBlWXovTEd0NHhaY2prOUhWSHJzTCs5SnVMcmNudHpjdTVMRSsy?=
 =?utf-8?B?SHJndmdid05La3R1UzBqZXcyOTB5bVI4V2JvTzNXN3RkeDB2ZWNmVVBPcGo5?=
 =?utf-8?B?WlVkS0Y5UStHR3AwNGhiWnRWTzRYYk5jUmVQZkwvZDByL0JuTW9pbnZrYWJl?=
 =?utf-8?B?NkVpSjExbWF3aFY0SmpraDRpZHhWdEpNV0VwVnBQSWpTUEg2S1RYdENpMmZG?=
 =?utf-8?B?UTBFTUFDVjNNVmdJTC9qRDVLd0tPZExVQmhWa3BHL09zeTBKT3FZWmMrdFU4?=
 =?utf-8?B?d3VJOHBqY1pYbThBL0JDUlNSbUQvVlVWMEpKUi82OFhFNDE3U0FMZEJXdCtZ?=
 =?utf-8?B?MlBOTEdOYmdpMWErYzN4Sm5ySTBuNjdUYVhCZE1RaGVLdklCOFIyU1hEbWxi?=
 =?utf-8?B?emt6Tk42M0tCMW1NcjhLbTBTRzFWdVkrbjNmRkN0bVRiektTdWlKM1NLd3dD?=
 =?utf-8?B?cFM0M1lJa0NtUGRObEhYVGpCZDJEdTg0S1FtRTMzMEhJemxWVUpzZ3FjR3E5?=
 =?utf-8?B?c3N4Y1prdmRzNWRtZWZqcy9VMGdySFhQVzllVDVqYTRkWTB2aUUxODk4TE13?=
 =?utf-8?B?REJSdnBnOGhhMkVXdTZYaUQvUGpDUTRja2k0aGsrOVE0SWticTJnK1BMYnBv?=
 =?utf-8?B?U0c4cVkwdlY2QUx5cGwxN2tULzJudHNDdlAyeXNERThmZnFMb0tjTkVLcmhB?=
 =?utf-8?B?czJPVmhBSm5CaklGNjdsZXJIdm9JQzlKbHZKN0JoN1dhNUtraXJWaEJjWldV?=
 =?utf-8?B?M0dNZHR2VExab3MwUldXQzBTYmlzWjlrdXRPRDFTb3V5ZFErWDZRcjkycm5l?=
 =?utf-8?B?amc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb817f8-edf5-4a67-5be1-08dd0e2070fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 13:44:25.3867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6A8IyRUtm8pZCLWFA1HtqW5NAO/g5INEMluhBzeHhCGkrKhz7jPeCFasGvvBMn61kAQJyt/cBNjCqez6eB3DP9vtKHlPflrGFXAqV/5qn1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8000

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjYgTm92ZW1iZXIg
MjAyNCAxMzo0Mg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzE1XSBzb2M6IHJlbmVzYXM6
IEFkZCBTWVNDIGRyaXZlciBmb3IgUmVuZXNhcyBSWiBmYW1pbHkNCj4gDQo+IEhpIEJpanUsDQo+
IA0KPiBPbiBUdWUsIE5vdiAyNiwgMjAyNCBhdCAxMDoyOOKAr0FNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogQ2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+
ID4gU2VudDogMjYgTm92ZW1iZXIgMjAyNCAwOToyMQ0KPiA+ID4gU3ViamVjdDogW1BBVENIIHYy
IDAyLzE1XSBzb2M6IHJlbmVzYXM6IEFkZCBTWVNDIGRyaXZlciBmb3IgUmVuZXNhcw0KPiA+ID4g
UlogZmFtaWx5DQo+ID4gPg0KPiA+ID4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFRoZSBSWi9HM1Mgc3lzdGVtIGNv
bnRyb2xsZXIgKFNZU0MpIGhhcyB2YXJpb3VzIHJlZ2lzdGVycyB0aGF0DQo+ID4gPiBjb250cm9s
IHNpZ25hbHMgc3BlY2lmaWMgdG8gaW5kaXZpZHVhbCBJUHMuIElQIGRyaXZlcnMgbXVzdCBjb250
cm9sIHRoZXNlIHNpZ25hbHMgYXQgZGlmZmVyZW50DQo+IGNvbmZpZ3VyYXRpb24gcGhhc2VzLg0K
PiA+ID4NCj4gPiA+IEFkZCBTWVNDIGRyaXZlciB0aGF0IGFsbG93cyBpbmRpdmlkdWFsIFNZU0Mg
Y29uc3VtZXJzIHRvIGNvbnRyb2wNCj4gPiA+IHRoZXNlIHNpZ25hbHMuIFRoZSBTWVNDIGRyaXZl
ciBleHBvcnRzIGEgc3lzY29uIHJlZ21hcCBlbmFibGluZyBJUA0KPiA+ID4gZHJpdmVycyB0byB1
c2UgYSBzcGVjaWZpYyBTWVNDIG9mZnNldCBhbmQgbWFzayBmcm9tIHRoZSBkZXZpY2UgdHJlZSwg
d2hpY2ggY2FuIHRoZW4gYmUgYWNjZXNzZWQNCj4gdGhyb3VnaCByZWdtYXBfdXBkYXRlX2JpdHMo
KS4NCj4gPiA+DQo+ID4gPiBDdXJyZW50bHksIHRoZSBTWVNDIGRyaXZlciBwcm92aWRlcyBjb250
cm9sIHRvIHRoZSBVU0IgUFdSUkRZIHNpZ25hbCwgd2hpY2ggaXMgcm91dGVkIHRvIHRoZSBVU0IN
Cj4gUEhZLg0KPiA+ID4gVGhpcyBzaWduYWwgbmVlZHMgdG8gYmUgbWFuYWdlZCBiZWZvcmUgb3Ig
YWZ0ZXIgcG93ZXJpbmcgdGhlIFVTQiBQSFkgb2ZmIG9yIG9uLg0KPiA+ID4NCj4gPiA+IE90aGVy
IFNZU0Mgc2lnbmFscyBjYW5kaWRhdGVzIChhcyBleHBvc2VkIGluIHRoZSB0aGUgaGFyZHdhcmUg
bWFudWFsIG9mIHRoZSBSWi9HM1MgU29DKSBpbmNsdWRlOg0KPiA+ID4NCj4gPiA+ICogUENJZToN
Cj4gPiA+IC0gQUxMT1dfRU5URVJfTDEgc2lnbmFsIGNvbnRyb2xsZWQgdGhyb3VnaCB0aGUgU1lT
X1BDSUVfQ0ZHIHJlZ2lzdGVyDQo+ID4gPiAtIFBDSUVfUlNUX1JTTV9CIHNpZ25hbCBjb250cm9s
bGVkIHRocm91Z2ggdGhlIFNZU19QQ0lFX1JTVF9SU01fQg0KPiA+ID4gICByZWdpc3Rlcg0KPiA+
ID4gLSBNT0RFX1JYVEVSTUlOQVRJT04gc2lnbmFsIGNvbnRyb2xsZWQgdGhyb3VnaCBTWVNfUENJ
RV9QSFkgcmVnaXN0ZXINCj4gPiA+DQo+ID4gPiAqIFNQSToNCj4gPiA+IC0gU0VMX1NQSV9PQ1RB
IHNpZ25hbCBjb250cm9sbGVkIHRocm91Z2ggU1lTX0lQQ09OVF9TRUxfU1BJX09DVEENCj4gPiA+
ICAgcmVnaXN0ZXINCj4gPiA+DQo+ID4gPiAqIEkyQy9JM0M6DQo+ID4gPiAtIGFmX2J5cGFzcyBJ
MkMgc2lnbmFscyBjb250cm9sbGVkIHRocm91Z2ggU1lTX0kyQ3hfQ0ZHIHJlZ2lzdGVycw0KPiA+
ID4gICAoeD0wLi4zKQ0KPiA+ID4gLSBhZl9ieXBhc3MgSTNDIHNpZ25hbCBjb250cm9sbGVkIHRo
cm91Z2ggU1lTX0kzQ19DRkcgcmVnaXN0ZXINCj4gPiA+DQo+ID4gPiAqIEV0aGVybmV0Og0KPiA+
ID4gLSBGRUNfR0lHQV9FTkFCTEUgRXRoZXJuZXQgc2lnbmFscyBjb250cm9sbGVkIHRocm91Z2gg
U1lTX0dFVEh4X0NGRw0KPiA+ID4gICByZWdpc3RlcnMgKHg9MC4uMSkNCj4gPiA+DQo+ID4gPiBB
cyBkaWZmZXJlbnQgUmVuZXNhcyBSWiBTb0Mgc2hhcmVzIG1vc3Qgb2YgdGhlIFNZU0MgZnVuY3Rp
b25hbGl0aWVzDQo+ID4gPiBhdmFpbGFibGUgb24gdGhlIFJaL0czUyBTb0MsIHRoZSBkcml2ZXIg
aWYgZm9ybWVkIG9mIGEgU1lTQyBjb3JlDQo+ID4gPiBwYXJ0IGFuZCBhIFNvQyBzcGVjaWZpYyBw
YXJ0IGFsbG93aW5nIGluZGl2aWR1YWwgU1lTQyBTb0MgdG8gcHJvdmlkZSBmdW5jdGlvbmFsaXRp
ZXMgdG8gdGhlIFNZU0MNCj4gY29yZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBS
ZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHJldmlldyENCj4gDQo+ID4gPiAtLS0NCj4gPiA+DQo+ID4gPiBDaGFu
Z2UgaW4gdjI6DQo+ID4gPiAtIHRoaXMgd2FzIHBhdGNoIDA0LzE2IGluIHYxDQo+ID4gPiAtIGRy
b3BwZWQgdGhlIGluaXRpYWwgYXBwcm9hY2ggcHJvcG9zZWQgaW4gdjEgd2hlcmUgYSB3aXRoIGEg
cmVzZXQNCj4gPiA+ICAgY29udHJvbGxlciBkcml2ZXIgd2FzIHByb3Bvc2VkIHRvIGhhbmRsZSB0
aGUgVVNCIFBXUlJEWSBzaWduYWwNCj4gPiA+IC0gaW1wbGVtZW50ZWQgaXQgd2l0aCBzeXNjb24g
cmVnbWFwIGFuZCB0aGUgU1lTQyBzaWduYWwgY29uY2VwdA0KPiA+ID4gICAoaW50cm9kdWNlZCBp
biB0aGlzIHBhdGNoKQ0KPiANCj4gWy4uLl0NCj4gDQo+IFdoZW4gcmV2aWV3aW5nLCBwbGVhc2Ug
dHJpbSB5b3VyIHJlc3BvbnNlLCBzbyBvdGhlciBwZW9wbGUgZG9uJ3QgaGF2ZSB0byBzY3JvbGwg
dGhyb3VnaCBodW5kcmVkcyBvZg0KPiBsaW5lcyBvZiBxdW90ZWQgdGV4dCwgdG8gZmluZCBhbnkg
b3RoZXIgY29tbWVudHMgKGlmIGFueSkuDQoNClNvcnJ5IGZvciB0aGF0LiBXaWxsIHRha2UgY2Fy
ZSBuZXh0IHRpbWUuDQoNCkNoZWVycywNCkJpanUNCg==

