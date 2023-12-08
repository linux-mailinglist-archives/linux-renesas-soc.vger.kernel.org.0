Return-Path: <linux-renesas-soc+bounces-840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2680991F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 03:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5233B281E7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 02:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA1C1C20;
	Fri,  8 Dec 2023 02:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDNmajmT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2B910EB;
	Thu,  7 Dec 2023 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702002081; x=1733538081;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k0xX0U9A9hjV9ZXeF3hEaL4kmfEXtPP/A/7Qe5rpYWU=;
  b=EDNmajmTNMOBicGl7kOQU2LLEVYxFb3HLTca1dQkpBqlL6TC86YeoLBJ
   EdISAdNFQT5fdfOpJf1+TJ1RTG4JXoqWoltf02BQZiWHm3PjMuoTxWafh
   9Ax9kP2xd7H36qgRabkXNWXtbQVFE8cgh8VcasflFP56mAyMvGlKgxbwo
   1OOplNKzmIZ/2klV4VrS86ejMCaiSsNrMjznNxUQ0LtHeMbsJAOMSLhoY
   Zn5bQGvmZ4bWL3hQFAc7ou0HNQ2indTzEhUW8tj4nNTwfe0L+XqNPhQIv
   WWDL11kvC7YrW4ifK7i8tpr3rVfCaB9UDcpfBrUAfbs7GM6xdg91Xakv4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460824815"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="460824815"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 18:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="771974933"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="771974933"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Dec 2023 18:21:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 18:21:20 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 18:21:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 18:21:20 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 18:21:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXEf85nvUzExQ/8V0VD7HkXfZNxk5XlvmTepELoedLdQnaZIUiVqW2Q9WQ0pMN7dz1Pv7XXRwIMwEmmYqikTJGkQ6yBvVXfu+tW6GKnm6dT70fNoAFrUFiIAlLjPWZGg5YMrq/eMt9UPgATDXZ5QP07nW0iCte8cU7/lk4z4bSVHr2439paEfo2ij2AVCXejJDLFhHEMExpaY9IqdCATGo6C3vuVEJce+KWTMX1zjBnPo/nDaklnejACERazgsPVFBZGwHY8QUhlkyHQl34NXwAf+FKEE5zOxyUqGH8VuK86/LzL4sOmM6JkS0CKHPJ6vTndMOLzQXx1QUo/KrlR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0xX0U9A9hjV9ZXeF3hEaL4kmfEXtPP/A/7Qe5rpYWU=;
 b=bJasde5G93MYBvAZP2ss23pBSJKzi5wzmWqyLwlf0Rc5e3bDw0vyXdaLgXXDpa/A/UHWfWmwa+PfHagmiRwKiT+gcOKjZETgbSIgH99d/IqUm922YYTbUGmQIWAjQDVxPiHWTpqyvhMtgW9ZUxFBKxyUNhTbWbrOMIapuftQc6ezCnwul8VmFjvelP2pWUkctNt01frxspAkq7EFWr1kGj26rD9E5OZ3MsfWp4vAZPLxWeD48lcmPlqrIs77OeCjxTE1isWIyFYdI1Bn/DTFsDlrRtSf46AsCb6xeqYMXB9vjMgxfXdzH8iVFakQnA2ubLk+BD5EPKziKaJ/KxUQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5626.namprd11.prod.outlook.com (2603:10b6:510:ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 02:21:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 02:21:12 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>,
	"lee@kernel.org" <lee@kernel.org>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "krzk@kernel.org" <krzk@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "support.opensource@diasemi.com"
	<support.opensource@diasemi.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Thread-Topic: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Thread-Index: AQHaKAQUO9euSvpYFkylTrhjtyLyqbCb/o8AgABBiICAAB8wAIACSeAA
Date: Fri, 8 Dec 2023 02:21:12 +0000
Message-ID: <20eeb6e93e2ca43c2df336f4e2c96f81e34e9e55.camel@intel.com>
References: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
	 <202312061323.Zk81yCZU-lkp@intel.com>
	 <TYVPR01MB11279FA6949EFAE62C70EB2948684A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
	 <20231206132813.GC3375667@google.com>
	 <TYCPR01MB112691F765724764ED08F7FBB8684A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB112691F765724764ED08F7FBB8684A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5626:EE_
x-ms-office365-filtering-correlation-id: 4559915a-b940-470f-b471-08dbf7945942
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z3mAROSbU8L+2sXxKPz3h1x5bMyBilbIlTJMnsUv484THegF9ccGHuRigZJQUSuM8NiLnzOyI2KWW7p97mbxBd5LW2HdmbXxWh1OcY38eF8YEKHFp/xa/x4wl6mgnFKECOrHpVXycFYzgeIQfAzqXC2y/ojyw57fH0POdvttjZHsnTfu/fh64rxlraoYX78hzUpbkfS1Xfb/4fk/lGZlqTjPI8YCaav9uEbk8toi7xFdEUPPT8oHi/D3NWCZsaNrf9JeaMXwiX8APynNA5W9ekFd3yaqA2FMhDnJ+3h63/6UVJQe1RDbcwthcKJY1rToh1lKCvhRmPzrIq0hJ0IT3wnM/fe9mPwIVg/VE589dvyEZwLcIbSQF5ak4QE5Zncb7DikcABKVjiYDpYrXR2Ug4LVI+1YT0kq+/E+lUKPyPg1KLCheuc6KupQAMn+NEYXWr+ISHYBHA1BPDpOjVLdnH/rC7wY2xb9uJOl3NYXPOudt5oqnpk64WiLyLkojqP6hh0Ehf7kNKHocFAJCCfdc592xusoumC+qBq+aiUXoN0W4SLXC0BrkVUIX4xMGznDSRqQ0LrlA/4JeuAi9k2IW6FwYRZjpmyb219IsQgpNKdJfg+euz5AtmLhygaiVEkn7BmVH4l3PaGm85fWmRX/QXcvxObik+T1SvSTDlI7dCk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(1800799012)(186009)(64100799003)(451199024)(2906002)(5660300002)(7416002)(4326008)(8936002)(8676002)(316002)(66946007)(64756008)(66556008)(54906003)(66446008)(66476007)(76116006)(91956017)(110136005)(478600001)(2616005)(6486002)(53546011)(6512007)(6506007)(71200400001)(36756003)(41300700001)(26005)(83380400001)(38100700002)(38070700009)(122000001)(82960400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmhPZlkyOTI1ZWFHeWhXWFVDaHdjVERsNVByWHRLRS92MkJYYjNOY3pXWC9K?=
 =?utf-8?B?MzUzaFhVYkRCRlhZL0wwOTNuZGJoTEdzUE50aHVldnJkMVQ3MnRXMlE4MkRM?=
 =?utf-8?B?KytjU3JIRFZranRPZzYwUk56WTR5ZGkzWHpzc1pISTk2ZVdLR2N5RXBTUFND?=
 =?utf-8?B?bTArakNuTXh3R2ZtTW5pRjlab2krQmcvRUpXaFR3eG0vQTA5ckRPWFpWRkxU?=
 =?utf-8?B?MDNneVRoSlJhcHU4Q28rcExkdTA5U0d5NkxlT3l0NUNvQ3VwallwUm9HZjVw?=
 =?utf-8?B?T3oyMG44UmlaTHdtYU51N2ZwdWI1QmYrVUVBQjlGVUNQRGtCdFIxYXNRYXRV?=
 =?utf-8?B?T28wQktTdFdlLzJuSEpmUGZ5aWkyR2hFQ2c1SE1VM09Pc3l1V0hCT2tXOUlD?=
 =?utf-8?B?L2h1Ty9Bd3JzbkNCY0pjNTZoZFdiOVVwNTZIQlF1ODNsUTMxSkg4cm5QdU1B?=
 =?utf-8?B?RU5LRnUvVlZxQzFuOGllZ0MrSHFyT2ZzRDJ0WjRGemNYZWVPUDNTMDNTend1?=
 =?utf-8?B?U1dJWXk2WTIrRGEvYklYVE5uWWF4Ymk3ald5UHgzN1Z1bmxLSDIxTDNBazFh?=
 =?utf-8?B?ZWtYbTF5MTNPRzJuK0c5SGtlS2ZKVS82NXRqQUVyVFhEUHlBSHlHL0luSTZm?=
 =?utf-8?B?OFZPV0FCdm1JSFMxSmRZRmp1aHJ0M3V2bFNaTDhHK3hEUUhzaXl6YlJwRlhr?=
 =?utf-8?B?TEQ0NlJGZ0tGMUdaMXVjYW5nR29VMkUyaWhDNGt5cGJtbndoeGcyakZmMGsy?=
 =?utf-8?B?UHFXTnFpamNyRzRCUFVqdVhmNlhiZUs1TnFVbmh4cGxzZU1IZTMxWStNRHFZ?=
 =?utf-8?B?Y21obDRSazRtZUFzdWtydEd1VTdWYUtGQmlIL1pmamphOG13MXd3THhWOGJw?=
 =?utf-8?B?aG1UcTRvQ0FnS3Q1ZXFid3dMSTBhMTBSVXdSMEZ1YUkwdG9NNVdnV3dEcjV4?=
 =?utf-8?B?a2NJaDhUYjA1Tml5TnlsNU0vZUpQOGZZUEVpYlVFU3hLUExNZGIzY0h4dlFi?=
 =?utf-8?B?elZELzk3blBCeHVyNFNJM1RCNTUwRXZscnlpSUdIc2VpTHpsMitlZHJNc3U0?=
 =?utf-8?B?T3JFWjB5bUVuMGdYVFV0Z01nRnJGOWVMRFZFS1JpQ0Z6UCs0VkxjWThTaCsx?=
 =?utf-8?B?VDllY0N1ZFJKZHN2WmpGQmo1c0VBTnphWDd4N2J2bU1XQkhJK2ZtaXpBSCto?=
 =?utf-8?B?YWx3a2hpQzIwNkxxdklHam5tWXAwVjdSMFBoVzRhNzRkVFNDc3A5UnV6T3h3?=
 =?utf-8?B?ZE9EN1RnbUsycVBTenR1a2s5TEEyTnBiTGhKcmVWYkJGUE9yTjNNdkU2ME44?=
 =?utf-8?B?TTZxSGY0SUlIQlE2MmFYNnYwbEpZcnl3WkRQc3BrMVlkV0NzUmt3QVJqNHVM?=
 =?utf-8?B?OGcyWlhYblJoMytzK2hsTDJZM01PVlczaTUweEEvbmtKWlFLSUd0QVhzeTAz?=
 =?utf-8?B?UXhqak5tSGphd2hGTHFMWmM2VHpndHBzdWl6VTdDc0p5QzBpYk15Z2t6eW9z?=
 =?utf-8?B?RU4wTWJOM25yMXZPOGZ0WWV5UXF5RlRuNHpDSjBQOEkzWFYvWGV4UFZOblhT?=
 =?utf-8?B?N1QwdjUzRGtRU1E0Z0IydDhoSVRCWkQwQ3pQRHBZMEpTVFY4L1pFZEx0bUJQ?=
 =?utf-8?B?QXpiNDZCOFNMWmwyQzhYY1lDUkVoQ3FwbFl1d1BraEhBSkU2SHpiM3QxbkU1?=
 =?utf-8?B?MEpCdTJHdEZLYnFVMVliTVV3VmhSaEcxTVI2YUZuRERTYTZ0ajdoV2NjWGpT?=
 =?utf-8?B?ckM4VVdHQ2hkdjNvSjY0R0Fld21IMzlEd2lON2FuT09yOU1KYXlkQnpjTTJ6?=
 =?utf-8?B?ZllVU2FuT2Q2RTJTT1VwSnFmeWZUbisrV1phUTg4TDBYb2pTVkR4QkpKd1ZH?=
 =?utf-8?B?cklCZitjRDBuSmovVktJRDgvbFRlY08vRmFIZnoxejk1RnFhZjBUbG93dkZ6?=
 =?utf-8?B?U29XWjJKYmV1WlNTb3V0Z1lsWHMyTzdIaklUYlFwcVc0M0tMRDhDNFd3MHg5?=
 =?utf-8?B?WEVQVVlHZ2dVb1BxdnR4N3RsRDh2VlhXQ3Zxb3RhbHh6TTNBZ29PK21GN2hk?=
 =?utf-8?B?WFZ1UjVPTHNIekxKSjJXQzZaZkFXYjY1dWpjT3pQaEJLK2NOeTZPUHlQak9m?=
 =?utf-8?B?aWkwdTBRV2VJNEsxNXNXYVp1UFJLNXJEdlZBdDlTYVVUMzVjRUdzTTVBS3Va?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D93174ED54637D4CB4582FE6BFA69799@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4559915a-b940-470f-b471-08dbf7945942
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 02:21:12.7259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E00E5Xqwy/cUGEvBmDf554TPI/1Er22dxrKXbBnr7t7NMWJRuoL7SAX9BR+3Ignby3TybT4AyxH6XtB5Hkt3mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5626
X-OriginatorOrg: intel.com

SGkgQmlqdSwgSGkgTGVlLA0KDQpPbiBXZWQsIDIwMjMtMTItMDYgYXQgMTU6MTkgKzAwMDAsIEJp
anUgRGFzIHdyb3RlOg0KPiBIaSBMZWUgSm9uZXMsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gRnJvbTogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4NCj4gPiBTZW50
OiBXZWRuZXNkYXksIERlY2VtYmVyIDYsIDIwMjMgMToyOCBQTQ0KPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNC82XSBkdC1iaW5kaW5nczogbWZkOiBDb252ZXJ0IGRhOTA2MiB0byBqc29uLQ0KPiA+
IHNjaGVtYQ0KPiA+IA0KPiA+IE9uIFdlZCwgMDYgRGVjIDIwMjMsIEJpanUgRGFzIHdyb3RlOg0K
PiA+IA0KPiA+ID4gSGkga2VybmVsIHRlc3Qgcm9ib3QsDQo+ID4gPiANCj4gPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbToga2VybmVsIHRlc3Qgcm9ib3QgPGxr
cEBpbnRlbC5jb20+DQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC82XSBkdC1iaW5kaW5n
czogbWZkOiBDb252ZXJ0IGRhOTA2MiB0bw0KPiA+ID4gPiBqc29uLXNjaGVtYQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gSGkgQmlqdSwNCj4gPiA+ID4gDQo+ID4gPiA+IGtlcm5lbCB0ZXN0IHJvYm90IG5v
dGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoNCj4gPiA+ID4gDQo+ID4gPiA+IA0K
PiA+ID4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAo
aS5lLiBub3QganVzdA0KPiA+ID4gPiBhIG5ldw0KPiA+ID4gPiB2ZXJzaW9uIG9mIHRoZSBzYW1l
IHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gPiA+ID4gPiBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gPiA+ID4gQ2xv
c2VzOg0KPiA+ID4gPiANCj4gPiA+ID4gQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBi
eSA+Pik6DQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gV2FybmluZzogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lucHV0L2RhOTA2Mi0NCj4gPiA+ID4gPiA+IG9ua2V5LnR4dA0KPiA+
ID4gPiA+ID4gcmVmZXJlbmNlcyBhIGZpbGUgdGhhdCBkb2Vzbid0IGV4aXN0Og0KPiA+ID4gPiA+
ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9kYTkwNjIudHh0DQo+ID4g
PiA+ID4gPiBXYXJuaW5nOg0KPiA+ID4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RoZXJtYWwvZGE5MDYyLQ0KPiA+ID4gPiA+ID4gdGhlcm1hbC50eHQNCj4gPiA+ID4g
PiA+IHJlZmVyZW5jZXMgYSBmaWxlIHRoYXQgZG9lc24ndCBleGlzdDoNCj4gPiA+ID4gPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvZGE5MDYyLnR4dA0KPiA+ID4gPiAN
Cj4gPiA+IA0KPiA+ID4gVGhlcmUgaXMgYW4gdXBkYXRlZCBwYXRjaCBzZXJpZXMgYXZhaWxhYmxl
WzFdIGFuZCBQbGVhc2UgcmV0ZXN0DQo+ID4gPiBhbmQNCj4gPiA+IHByb3ZpZGUgZmVlZGJhY2sg
aWYgYW55Pw0KPiA+IA0KPiA+IERvIHlvdSBvZnRlbiBmaW5kIHlvdXJzZWxmIGNoYXR0aW5nIHdp
dGggaW5hbmltYXRlL2F1dG9tYXRlZA0KPiA+IHNlcnZpY2VzPyA6KQ0KPiANCj4gRllJLCBiYXNl
ZCBvbiB0aGUgcHJldmlvdXMgZXhwZXJpZW5jZSwgdGhlcmUgYXJlIHNvbWUgcGVvcGxlIHVzZWQg
dG8NCj4gcmVzcG9uZA0KPiBldmVuIHRob3VnaCBpdCBpcyBhZGRyZXNzZWQgdG8ga2VybmVsIHRl
c3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Lg0KPiANCj4gSSBkb24ndCBrbm93IGFib3V0IHRoZSBj
dXJyZW50IHNpdHVhdGlvbi4NCg0KVGhlcmUgYXJlIGluZGVlZCBodW1hbnMgYmVoaW5kIHRoZSBy
b2JvdC4gQ3VycmVudGx5IHdlIGFyZToNCg0KUGhpbGlwIExpIDxwaGlsaXAubGlAaW50ZWwuY29t
Pg0KT2xpdmVyIFNhbmcgPG9saXZlci5zYW5nQGludGVsLmNvbT4NCll1amllIExpdSA8eXVqaWUu
bGl1QGludGVsLmNvbT4NCg0KV2Ugd2lsbCByZXNwb25kIGlmIGRldmVsb3BlcnMgbmVlZCBoZWxw
IG9yIGhhdmUgZmVlZGJhY2sgb24gdGhlIHJvYm90LA0KYnV0IHNvbWV0aW1lcyB3ZSBtYXkgbm90
IGJlIGFibGUgdG8gcmVzcG9uZCBpbiB0aW1lIGR1ZSB0byBiYW5kd2lkdGgNCm92ZXJsb2FkLiBT
b3JyeSBmb3IgYW55IGRlbGF5ZWQgcmVwbHkuDQoNCkFzIGZvciBCaWp1J3MgcmVxdWVzdCBvZiB0
ZXN0aW5nIHRoZSB1cGRhdGVkIHBhdGNoIHNlcmllcywgdGhlIHJvYm90DQpjYW5ub3Qgc3VwcG9y
dCBhdXRvLXRlc3RpbmcgZm9yIGl0IHlldC4gU29ycnkgZm9yIHRoaXMuIFdlIHN1Z2dlc3QNCmZp
cnN0IHRyeWluZyB0aGUgcmVwcm9kdWNlciBpbiB0aGUgb3JpZ2luYWwgcmVwb3J0IHRvIHNlZSBp
ZiB0aGUgaXNzdWUNCmNhbiBiZSByZXByb2R1Y2VkLCB0aGVuIGFwcGx5aW5nIHRoZSB1cGRhdGVk
IHBhdGNoIHNlcmllcyB0byBjaGVjayBpZg0KdGhlIHJlcG9ydGVkIGlzc3VlIGdvZXMgYXdheS4g
UGxlYXNlIGtpbmRseSBjb250YWN0IHVzIGlmIGFueSBwcm9ibGVtcw0KdXNpbmcgdGhlIHJlcHJv
ZHVjZXIuDQoNCkJlc3QgUmVnYXJkcywNCll1amllDQo=

