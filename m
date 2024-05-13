Return-Path: <linux-renesas-soc+bounces-5338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0C8C3EB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 12:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A47C283F2D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 10:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F19149E16;
	Mon, 13 May 2024 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="rH96d7W7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1601487EC;
	Mon, 13 May 2024 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715595258; cv=fail; b=d49llrgmjkp3oER81i7Vg79fwerwVcmwXLlh6vgZcjB91Gxhxltu9vc0kDovZ7bRK7M4Slb2LPXUaRnQlFl+RzXiFjpVbObtsJoMLCFIsIfDUwiow/rK5VbtTxqJ4MAmHEa+mYIw0p8JFmHc/w9cZ83yX0YsNsWAqBkw7c2ADLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715595258; c=relaxed/simple;
	bh=QmAuxmBTPy9/glKeFNanEQWpl7liFQnh93+mkcx2KgA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ejyLvBgQ0vDEebLl37RBGI+GmU8EHmrnoFqG5i/EpvljiQxFwCoqMcjmnlH7/vuooKMxBxCoIkQ9eDifAdH4GxMqJAw7tbKOXLbx76qsvSx5P2mFjAZwsMEsiXkUxYw0EeUc0BfcuNgIfoJ3k4QeL+pXausti4A19cUGFk1KAyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=rH96d7W7; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D9gWo7015207;
	Mon, 13 May 2024 03:13:47 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3y3gf4g2gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 03:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn/aFbrILaWQ/n9/cuDG0Orqzon0skMW6UJbgDn/04xtXCt2pO9ZGlAVAb/zwQZWaQAA5Fcx0WedP+3tgNqzYl2sr7msCb86AILrHW5Eo0Pt6F4C7ZymA5/7wo9gmagNznpjQUaRuMjg1GxCfUznLKNU4G3SBMV6JklUcljmPipDPlgIkLZRrijm0LdPx24JTPq3SNlgfttLAXpxyAVBZdDTPi9i94rr5cpqZ18+5jcvLa6L0Wf5RwSBUUfX9C6hpttXSL6jkKUGqcuMnkWHLRvA9ebxpzsFYWvNwYC8RVBFaogGXH+k4RvqFjJn7bZ3Hmz04Z+wFtH7W2CevbeSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmAuxmBTPy9/glKeFNanEQWpl7liFQnh93+mkcx2KgA=;
 b=EML2OBgbun1UB/WJgg78QqgQfIXlgszL3fHyZtYU/GeUa3SVP7pYVY9WQ6/c0ny7/T5Q07G7F9paWuJPIo1U3D/D/Aoxhd7mC7sa2oFDjGb1TWmIovxi8RNrIaDb++G6x6l/dCjB7Eu/R/h4km8XAVyoLdA9e8OTnQcp7lV4QR7PmU59PFgxXKZBzrJ9/WXDmHEvcDblvWicSbMLESdAAFiF3xudXtyeSWcvRhArXaq3ukuIjQQMebo2JXaB+A6n+ftxZN9HTedchucxsz543/qS03ZReEZqpTIqP7P733DdZMB9z24pz1bYmsD81U+DTDRbKW7eMLsnDnQO1M0MFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmAuxmBTPy9/glKeFNanEQWpl7liFQnh93+mkcx2KgA=;
 b=rH96d7W7G6HwcdMPSjwtImAK9IX6lZxlCpJC9y9yJiHIgc53FZb2NHlmEicTP1fnj6OwiCoBqb4KSY9F2Fjs55CKbzyqgWqrxJl556Ko/RaCDbLfUTRRzzXDpq/lyPNk+Jqy8fIQRBwrmssmlIpVaJ28pdJP7G/fQh+5p6QuV78=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by LV3PR18MB6219.namprd18.prod.outlook.com (2603:10b6:408:272::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:13:44 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:13:44 +0000
From: Hariprasad Kelam <hkelam@marvell.com>
To: Romain Gantois <romain.gantois@bootlin.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
	<clement.leger@bootlin.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v7 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
Thread-Topic: [PATCH net-next v7 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
Thread-Index: AQHapR48+TFK6SOwSU6rHILy2zg+Zw==
Date: Mon, 13 May 2024 10:13:44 +0000
Message-ID: 
 <PH0PR18MB4474A17977EBE99532E6282ADEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|LV3PR18MB6219:EE_
x-ms-office365-filtering-correlation-id: a3418cbf-49d1-4a3f-2270-08dc73355f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009|921011;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NDZvQ1lnNTlQT01ObHhZdm9CMjJSZi91ZnpUTzRrS1VGNFdFSVFBeE5Wdmdu?=
 =?utf-8?B?a045S1ZmUkJXK1BrTHJnbkZobStFVFFEVVBmbGJFc2J3a2FmR1JHZ29KMy9D?=
 =?utf-8?B?RzVvZi82cjlNSWUycURqbDVKTk5Oa29FOUVxWldVejQ3YlRYQXBIOWoraUtG?=
 =?utf-8?B?c3BVSkVOVTFUWEU5ZjI1cTd1OWdYdEpyNmgwK0RjL3FkWlV5OGI2YTVJdlhV?=
 =?utf-8?B?RFEycjh1MHZseDNQZW91QnlxQW9QWktqcnd3N0hINmtVdStCcG9oU3lUVCtK?=
 =?utf-8?B?UGo0Lzg3c21WTEdYWS9vU3FadDduR2h0bjlTb1pwTDhaQUhHbUZDWGZxWFZm?=
 =?utf-8?B?T1gvMjhmdjBqOHhQa01icG1JS1RNS1Z4NUF4S2VEM1VSUVhGT3ErUno5MFVL?=
 =?utf-8?B?OE5LSXBUOWFTdk9DOFBENDJmRGhuY0UvcnlwUEdFRC9FeTkwSVdsSkVHVG9J?=
 =?utf-8?B?UzU3bjhBaktiUlRnenRnaE9uRmRMaFB6OEdHQk1ldUlSUzFGM05IYWlHNHo1?=
 =?utf-8?B?Y2VEM0NwU2twRkVXRUl0OWI0SjhPU3hjUjNOS2xuZ3I2cDdQTVFnbDl2SHNE?=
 =?utf-8?B?dXlyNDJWLzVycE16N00vTjNtOEVWMmFNRVRrNzF6WTlHS3pVc3FkM2xGMFZX?=
 =?utf-8?B?VHNsWkI1Zm5vTE43R3RoUWtPdmU1Y3o3Z0dVdmZhcUNTNmVNVGllenZvcHo3?=
 =?utf-8?B?RlB2OWhZZmhuSytYYWluK2hVYnU2MGFsVWJXOHp3TlNiTHdFRVJTNUJBVGJz?=
 =?utf-8?B?TXUwbkpsdENkbUJIT2lDVVgwT09YdGNYWmRUekRWMUZoUEhZd2hNZnBSZlJy?=
 =?utf-8?B?bHdyOGJ2VVpvendQV3JTeXZVZXZ6Tnd1L2ZNcm0vdHY3SzBvMFJvU21XQjJh?=
 =?utf-8?B?SHcwbkpEVkR2RkhxYk5EdjIxMk83WFR2QmE1aFVwM1pLRThqZkNzSGkvaU0z?=
 =?utf-8?B?b3VlNTdLSzdXY1pHdjJnVHY2OFMrTTZjbHMyemFVdEZnc1RkdEVHcC9DdDlr?=
 =?utf-8?B?VHNrdFJpdEEzYUVGbk9MSFYyeWRXcyt5ZzVrSUpDLzUrUkYzQlRhcmJxc2tw?=
 =?utf-8?B?c1ZhNVAxNGMvMkMvZHdWRHgyMFJTY3RTMWVhT2NWY2ZQTERWRUY4eEdIa1Bz?=
 =?utf-8?B?RytmZmNmeXltNUlIaXN5UVorT1RzRlh3RGo1MXp3bTlvc0Z0YUdnUDhiR2hm?=
 =?utf-8?B?MDIwQlVHQ0loVjMvVTh2bUZiVjFKM1JzVE12Y3JxVGtZSEpUVlBTa2ZRZmpp?=
 =?utf-8?B?SlVkWEJMNjVuMnZBUm9vQWRDUFVyTFRrZW96MDF5RFpqNFAyc3MvdmEyR1F1?=
 =?utf-8?B?d01aS1RSQ1NkZWtOMERQZERhME55MFdQMURwZ3ROLytBcVRRWlR3eUY1UGRW?=
 =?utf-8?B?dHJPUGVyM2tUSjAxRFJSVXhWS2orQmN2TjlXa3lJRy9ubnJRNlZVdm5vYVh3?=
 =?utf-8?B?d3RnYndSdkJDT3gvUTltRjJyK3ZyS2g2SFFiM0tTcUVNUjhnMVIrVENWZTU2?=
 =?utf-8?B?S1lJZ0QrbzI1YnpCSHRZLzRGbFRiY0JBbUZrSEJLVE5VRDNaQjhMWFlNSEFi?=
 =?utf-8?B?d3lsSVZLY1k4TStld2pIQ3MyS3d1bTRvY3A4d1JqYk9yb0orcGlIT25BcEpJ?=
 =?utf-8?B?aHJ6MkhId1R5YnkyTUJuV0VYNE1XbjU4NzAxTUkzYjhDNE5GR05sLzhlV3Jp?=
 =?utf-8?B?NmRZRlI3VVNxQmhRQUVIQVZiMjJoTld2L3ltaENLMTBOR2MrSytiZXQvOGFy?=
 =?utf-8?B?YmFIWFhab3E1cnZSN0FrakZnOFVmcFJybDdpVC9DUGhpYlU1K1NyZ3FTMHRG?=
 =?utf-8?B?bWM0UkJDWTE4L0dQUGp5UT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4474.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eWxNZHJFSUo2dmxLYkVlOGJndmZmblVrb1h5UGtBbld3QW5uQnN6ODdWcWpR?=
 =?utf-8?B?UW9USEltMy84Rk5vWDFielpYcmxldzRETWFoc2JZTVh4RHNqL1ZtOWQvT2xQ?=
 =?utf-8?B?UVptWWZwOW1ZdGJxOEkxYk9tUm5WZ29RNDdBT0lTS2x2RzlMREhjclBGRmRZ?=
 =?utf-8?B?UkdhTW96T1JGMjRZRWpNdzlrYnFMaWcwSnB0NmZKZ0I1VDlYUlA3WGxGcEdT?=
 =?utf-8?B?YnAyenhubldJbFdkcU9wd0UxK1RKWUs1WHJ2SXBqbUJQTk0rVHdPZXVQd3Fx?=
 =?utf-8?B?b2FqT1hNMU0vTklOZWVDQ1lqVEt2MnVjOXpCU3hrOWljc3p0YWw4aTRDUkZN?=
 =?utf-8?B?ajQvanRyZkJvVWdWb1VPM055dnBzdFNkVy9OREN0amtwdlUwRVlac3Fmb3NW?=
 =?utf-8?B?YXAxUk91QkV5bzlqUSt3RWcwU2V1NVUyWFNCMHJ1MXJtM2xZelBwMW04MTNq?=
 =?utf-8?B?LzZESXV6SCtnUk94bHRMRmhrY1VZdXg4L3AxeHh5T2grYmdHSDk5cG1vd3Nv?=
 =?utf-8?B?ajN4c3hIOHk1UlJyN0JDN2JvUThsRGlUKzdqb3ZmY1FIb29KbVIzVjl0dE5Q?=
 =?utf-8?B?RytRaGNBYnJKd2doTmZPdTJHYnFza0dSS1Boc0hya1BKOGZBdEJlVk9rTk5R?=
 =?utf-8?B?bktjMStpbmNRK2MzVEZJSSsrQ0hkalAvVjhGQmp3cW5NV1EvZU41aXpicEVQ?=
 =?utf-8?B?SzREdGVJNmlnQXo1RU9NOUtTOGVodUdYd01reDRYVTZiL2ZLb3U0K3IxT2M5?=
 =?utf-8?B?cnVueWFKVnJVRVRreWtxYzNINkVjM3lRZThURTNtTG5ubXhxWlNnK1JGWmZx?=
 =?utf-8?B?V3V3ODhUVXl1SjcwQWllaStXV3NaUzE3VzExMmc2OGhsS29LNmkwNERXYlBj?=
 =?utf-8?B?RG13S2dSYkJkZXpjbVgvcWFNSlZuY3FQSCtpOVJvRmdUZ213amhsSXRkcHBj?=
 =?utf-8?B?Y0pGUnEyYTNDRFRzSkVQQ2JJeGtGa0VDVmNHa2ZiY3B3eVFuS2F6Z01PR0Mv?=
 =?utf-8?B?VlhGYmVlVEN2YTd0L0dxQXpnSHgzREhQZVZRZnBVNVpOY3hQUHlicHlRZllX?=
 =?utf-8?B?Y0g1dTlCWDFKaVZxRjlRYWw0cG5DeUJ6bUc4T3BVdFpkWnp2QWQvRDV1Lysw?=
 =?utf-8?B?Z3ZWRXpxbmlEbzUwUmtVWUlZeDFzYmFubXduL2FObE5ESDM5Z2oxRVBTWlBS?=
 =?utf-8?B?VDRhYlhNbk01UEdNQ0llcjQwTFhjbjMyNDJjMnNxN2szNDJId3RGWnM3aGY1?=
 =?utf-8?B?S2pZM2M3eW1Bak5DcWJOVi9MaS9JVmpZSFo5VVNYRVZuMi8vU0pOUDdyZTE1?=
 =?utf-8?B?SSswYzdFdVF6UlVOTG9xMGV3ZHAyMy9JTnJaWlQ4T3RjeUw3QnJLWk5Hdmx4?=
 =?utf-8?B?SkZDR0FIcit5WTFnZ1VEa0YwSWYxZzI1UXJSRk82WjZqemR6TnBDaUhrTmlJ?=
 =?utf-8?B?YVBSK3c3aUhnVG13WnQ4ZTNlYXVKaXUvVVNCNHc5Y2w2UjZHZVJmUDFvSGs2?=
 =?utf-8?B?SWlRQmQvbVhYcnhVdExwNnV4SHo2R0ZPZUVDQjVsTkVOU01wU2JmcG4xZ3Nm?=
 =?utf-8?B?ZTUzdXVyalJvSWJMQ3lldm96UzF6eTl1VE1FK0V4M25aRWoyaTJxNTcxZnVF?=
 =?utf-8?B?VXJmSGRya1Y5cmJJdVk3VSs4VEdEYmZTSzhXRXVPdXZzU3l5Sy9oOFFBVk5F?=
 =?utf-8?B?bHFxL0R3UlJsL1dQbjQ3Y3ZwQ0Nrb2tVWThkZU9vczB2d3VHLzVaamkvS1pu?=
 =?utf-8?B?VktlRTJzbUVPTyt2Um1hSVB3eWV0SCtPSngya1hHSmVzVmxiRHZURmswTmlm?=
 =?utf-8?B?NkFxbVNvaC9SM0piQTdBZEpIbXVHS1RSR2pXY2wzRkx3ajUvbVNKajQvV0Fn?=
 =?utf-8?B?TElnbXpUSFYrNEs3MVBtT1RFTjNQVHhUejcvdUdpQnllTS82K01oN1EwaW9J?=
 =?utf-8?B?TnVSbGhLb1B1Ky9ES0M5QUJFaTRlMEJ2NWhiM3N6dTBGelFQaGN0clE4U3Bv?=
 =?utf-8?B?cGZJR3Yra1NZcHVORnpwMUN2TFdvS0RQdXFNanhiWDNBckh0WS9zRXVyVUFU?=
 =?utf-8?B?ZEVUL0c4Y2F0VTRUTkZJWUV1NXUzb0ZvcVJKbzd4a3VnUDRhVmI5RlVCTzF1?=
 =?utf-8?Q?JdMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4474.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3418cbf-49d1-4a3f-2270-08dc73355f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:13:44.5794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsAQ8p6YYNtRjUIeX/uiKPgYd462AYiDt9uCcfCCPqFhgdi2hEphi1wvFPr7uvCjI2yjgvIjaYC6so4h/9wJAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6219
X-Proofpoint-ORIG-GUID: KsA8zPL_jDDjYsXWeaEqVZVr-uI-N1An
X-Proofpoint-GUID: KsA8zPL_jDDjYsXWeaEqVZVr-uI-N1An
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02

DQoNCj4gRnJvbTogU2VyZ2UgU2VtaW4gPGZhbmNlci5sYW5jZXJAZ21haWwuY29tPg0KPiANCj4g
Q3VycmVudGx5IHRoZSBYUENTIGhhbmRsZXIgZGVzdHJ1Y3Rpb24gaXMgcGVyZm9ybWVkIGluIHRo
ZQ0KPiBzdG1tYWNfbWRpb191bnJlZ2lzdGVyKCkgbWV0aG9kLiBJdCBkb2Vzbid0IGxvb2sgZ29v
ZCBiZWNhdXNlIHRoZSBoYW5kbGVyDQo+IGlzbid0IG9yaWdpbmFsbHkgY3JlYXRlZCBpbiB0aGUg
Y29ycmVzcG9uZGluZyBwcm90YWdvbmlzdA0KPiBzdG1tYWNfbWRpb191bnJlZ2lzdGVyKCksIGJ1
dCBpbiB0aGUgc3RtbWFjX3hwY3Nfc2V0dXAoKSBmdW5jdGlvbi4gSW4NCj4gb3JkZXIgdG8gaGF2
ZSBtb3JlIGNvaGVyZW50IE1ESU8gYW5kIFhQQ1Mgc2V0dXAvY2xlYW51cCBwcm9jZWR1cmVzLCBs
ZXQncw0KPiBtb3ZlIHRoZSBEVyBYUENTIGRlc3RydWN0aW9uIHRvIHRoZSBkZWRpY2F0ZWQgc3Rt
bWFjX3Bjc19jbGVhbigpDQo+IG1ldGhvZC4NCj4gDQo+IFRoaXMgbWV0aG9kIHdpbGwgYWxzbyBi
ZSB1c2VkIHRvIGNsZWFudXAgUENTIGhhcmR3YXJlIHVzaW5nIHRoZQ0KPiBwY3NfZXhpdCgpIGNh
bGxiYWNrIHRoYXQgd2lsbCBiZSBpbnRyb2R1Y2VkIHRvIHN0bW1hYyBpbiBhIHN1YnNlcXVlbnQg
cGF0Y2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBn
bWFpbC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50
b2lzQGJvb3RsaW4uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWlu
LmdhbnRvaXNAYm9vdGxpbi5jb20+DQo+IFJldmlld2VkLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNs
ZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPg0KPiAtLS0NCj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oICAgICAgfCAgMSArDQo+ICBkcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgIDYgKysrKystDQo+IGRy
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMgfCAxNCArKysr
KysrKysrKy0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hYy5oDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjLmgNCj4gaW5kZXggZGRkY2FhOTIyMGNjMy4uYmFkZmU2ODZhNTcwMiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgNCj4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgNCj4gQEAgLTM2
MSw2ICszNjEsNyBAQCBpbnQgc3RtbWFjX21kaW9fdW5yZWdpc3RlcihzdHJ1Y3QgbmV0X2Rldmlj
ZQ0KPiAqbmRldik7ICBpbnQgc3RtbWFjX21kaW9fcmVnaXN0ZXIoc3RydWN0IG5ldF9kZXZpY2Ug
Km5kZXYpOyAgaW50DQo+IHN0bW1hY19tZGlvX3Jlc2V0KHN0cnVjdCBtaWlfYnVzICptaWkpOyAg
aW50IHN0bW1hY194cGNzX3NldHVwKHN0cnVjdA0KPiBtaWlfYnVzICptaWkpOw0KPiArdm9pZCBz
dG1tYWNfcGNzX2NsZWFuKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KTsNCj4gIHZvaWQgc3RtbWFj
X3NldF9ldGh0b29sX29wcyhzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KTsNCj4gDQo+ICBpbnQg
c3RtbWFjX2luaXRfdHN0YW1wX2NvdW50ZXIoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LCB1MzIN
Cj4gc3lzdGltZV9mbGFncyk7IGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX21haW4uYw0KPiBpbmRleCAzZDgyODkwNGRiMGQzLi4wYWM5OWMx
MzI3MzNkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfbWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMNCj4gQEAgLTc3ODksOCArNzc4OSw5IEBAIGludCBzdG1tYWNfZHZy
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldmljZSwNCj4gDQo+ICBlcnJvcl9uZXRkZXZfcmVnaXN0
ZXI6DQo+ICAJcGh5bGlua19kZXN0cm95KHByaXYtPnBoeWxpbmspOw0KPiAtZXJyb3JfeHBjc19z
ZXR1cDoNCj4gIGVycm9yX3BoeV9zZXR1cDoNCj4gKwlzdG1tYWNfcGNzX2NsZWFuKG5kZXYpOw0K
PiArZXJyb3JfeHBjc19zZXR1cDoNCj4gIAlpZiAocHJpdi0+aHctPnBjcyAhPSBTVE1NQUNfUENT
X1RCSSAmJg0KPiAgCSAgICBwcml2LT5ody0+cGNzICE9IFNUTU1BQ19QQ1NfUlRCSSkNCj4gIAkJ
c3RtbWFjX21kaW9fdW5yZWdpc3RlcihuZGV2KTsNCj4gQEAgLTc4MzIsNiArNzgzMyw5IEBAIHZv
aWQgc3RtbWFjX2R2cl9yZW1vdmUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCWlmIChwcml2LT5w
bGF0LT5zdG1tYWNfcnN0KQ0KPiAgCQlyZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5wbGF0LT5z
dG1tYWNfcnN0KTsNCj4gIAlyZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5wbGF0LT5zdG1tYWNf
YWhiX3JzdCk7DQo+ICsNCj4gKwlzdG1tYWNfcGNzX2NsZWFuKG5kZXYpOw0KPiArDQo+ICAJaWYg
KHByaXYtPmh3LT5wY3MgIT0gU1RNTUFDX1BDU19UQkkgJiYNCj4gIAkgICAgcHJpdi0+aHctPnBj
cyAhPSBTVE1NQUNfUENTX1JUQkkpDQo+ICAJCXN0bW1hY19tZGlvX3VucmVnaXN0ZXIobmRldik7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWRpby5jDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21kaW8uYw0KPiBpbmRleCAwNTQyY2ZkMTgxN2U2Li43M2JhOTkwMWE0NDM5IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWRpby5jDQo+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMN
Cj4gQEAgLTUyMyw2ICs1MjMsMTcgQEAgaW50IHN0bW1hY194cGNzX3NldHVwKHN0cnVjdCBtaWlf
YnVzICpidXMpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiArdm9pZCBzdG1tYWNfcGNzX2Ns
ZWFuKHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KSB7DQo+ICsJc3RydWN0IHN0bW1hY19wcml2ICpw
cml2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ICsNCj4gKwlpZiAoIXByaXYtPmh3LT54cGNzKQ0K
PiArCQlyZXR1cm47DQo+ICsNCj4gKwl4cGNzX2Rlc3Ryb3kocHJpdi0+aHctPnhwY3MpOw0KPiAr
CXByaXYtPmh3LT54cGNzID0gTlVMTDsNCj4gK30NCj4gKw0KPiAgLyoqDQo+ICAgKiBzdG1tYWNf
bWRpb19yZWdpc3Rlcg0KPiAgICogQG5kZXY6IG5ldCBkZXZpY2Ugc3RydWN0dXJlDQo+IEBAIC02
NzksOSArNjkwLDYgQEAgaW50IHN0bW1hY19tZGlvX3VucmVnaXN0ZXIoc3RydWN0IG5ldF9kZXZp
Y2UgKm5kZXYpDQo+ICAJaWYgKCFwcml2LT5taWkpDQo+ICAJCXJldHVybiAwOw0KPiANCj4gLQlp
ZiAocHJpdi0+aHctPnhwY3MpDQo+IC0JCXhwY3NfZGVzdHJveShwcml2LT5ody0+eHBjcyk7DQo+
IC0NCj4gIAltZGlvYnVzX3VucmVnaXN0ZXIocHJpdi0+bWlpKTsNCj4gIAlwcml2LT5taWktPnBy
aXYgPSBOVUxMOw0KPiAgCW1kaW9idXNfZnJlZShwcml2LT5taWkpOw0KPiANCj4gLS0NCj4gMi40
NC4wDQo+IA0KDQpSZXZpZXdlZC1ieTogSGFyaXByYXNhZCBLZWxhbSA8aGtlbGFtQG1hcnZlbGwu
Y29tPg0K

