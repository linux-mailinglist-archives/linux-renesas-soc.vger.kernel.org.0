Return-Path: <linux-renesas-soc+bounces-1298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F8824D15
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 03:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 306301F22E6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 02:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DA237A;
	Fri,  5 Jan 2024 02:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qwsxSrs6";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HGpvFhJ/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6720EB;
	Fri,  5 Jan 2024 02:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1704422569; x=1735958569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TfqlWcx/smI5DPFbXW07Xdbi2bp1H6j7hN7sOQ5Khi0=;
  b=qwsxSrs6Tn6O59h+KkuMRApzZBxNeo11qa03Kr9EjMDZLqh2izZt4KFW
   l3GFf6SKlHWRWVZgt1OBw3+CtLklpn157lTk+2aGNDsJsRkbaWKYcNfzb
   RUY4SKTOhDgnxH7KPQ/R/DkiUu+2p6YeOIQPBmxXWORdrey4OSZRDSp3T
   WE7Qr/zUx3P6v+j2z+254v0ATrjX8lT5IWphvwKV1LpY9urDx1Vcj3Gm7
   v0kGGojF42kI12IWoMTA76luF2sVf5EuD52aIn01RBZBBfEghAdGk33OR
   lT4MH1z5A/1Q31sFWuUZFsoqDVZtrr78lDZG35C7fgC9MBEcyHY0Jwxyl
   w==;
X-CSE-ConnectionGUID: HC1VGsYTRR6R8WSqtpj8ig==
X-CSE-MsgGUID: 6S619DfPQMaM7re+ZmlYXQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="15372093"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jan 2024 19:42:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 19:42:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 19:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdxsTw3iP8JfNCC9hcbJHUrSNjzYck6+veyJVqLCjL7cwpdsaMdjSZjfMadvMJrQ/pwgYYzvJUuX270gxluSkhbZ6Vb1BWQHzdoPr/mD+vC0gFv/Y60nMW4q+gfJIT16plHgzbMEKa3D4jy0u994CJJCWPzbg+dmFO/ekMkrHquM8r47DUv5F3BC0VsmwaTl7EJIHtAeG3YNQhXOF8cf2XaI/PghXTy6x5cuYaoQS14I9RSRtp1ogLxODFaGAO5FTKcOG0xIo/5kBxrmbCVPXvuy744kAI6odRbsqfG7jsNrHS9ZvR/rrNQmEFAc+8tQlj+QWYvnPh0jsU3/IrgsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfqlWcx/smI5DPFbXW07Xdbi2bp1H6j7hN7sOQ5Khi0=;
 b=APceI/RPW3jhzyK9jYTckZe+KDVSpR88QjaQxBGgnXXJSQUMaxI9RwJwmm2M15t2SOm5rxXsHGwY70QpaWkZyP7AkAav1Yv4QkyXkWbjb1sucLDfUtmaP85B5oyExEJIAeE80GU7B0xubsILvZwY7I5gdPQn5AK4U4Uz50iMpo31UHarehc2zrANyfG1CXMhZdL2aEscfRKoSK/QgiqK6QkHypdVuIOcO1A2nzemDRf8Ul1FpokYipYHc20NLR8KsiJ1TXL1G3UYIhRaFNJQ7GWRvhniZ5c+fbpyQxfzX+lF1q1Jy78AvFFRHUb47vmMWvBHtoK70be9GmmU1xZj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfqlWcx/smI5DPFbXW07Xdbi2bp1H6j7hN7sOQ5Khi0=;
 b=HGpvFhJ/eiYXz7PKf6uOy//DlgPK0gTV+SmqeguJM9ZqK7969MWST1eYbvjDbusuWrC1uZJjaO8keVUqPT0LHrt3/ok2t3bTIGx5pz0bjIXlcin5brQl+pOIM/BjgrMr5E9ui6EfFgqwYLhI9oPe3cpcHVNGD2gAkxCI1N7qa8n3IIABKfMNQhwP808/h/hgWH+ZUDHYnwqBf9vNhO2dF4VvKo4UGyalo1x/yNCTxRpHfKDL0sqJK1i4r5auqcNAR14uEb0Nm6e22V7ucLGILTp9ISnbtSOXpdEGeL+OzcUWk59yfGN4pU9dL9MT3qu7Snd5VY2hBQVVzhaV7AemJg==
Received: from PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 by SA0PR11MB4671.namprd11.prod.outlook.com (2603:10b6:806:9f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 02:42:24 +0000
Received: from PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::18cb:134a:e51a:2ce4]) by PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::18cb:134a:e51a:2ce4%7]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 02:42:24 +0000
From: <Arun.Ramadoss@microchip.com>
To: <kuba@kernel.org>, <davem@davemloft.net>
CC: <olteanv@gmail.com>, <andrew@lunn.ch>, <claudiu.manoil@nxp.com>,
	<dqfext@gmail.com>, <Woojung.Huh@microchip.com>,
	<linux-renesas-soc@vger.kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <clement.leger@bootlin.com>,
	<UNGLinuxDriver@microchip.com>, <edumazet@google.com>, <pabeni@redhat.com>,
	<arinc.unal@arinc9.com>, <alexandre.belloni@bootlin.com>,
	<daniel@makrotopia.org>, <hauke@hauke-m.de>, <sean.wang@mediatek.com>,
	<kurt@linutronix.de>, <netdev@vger.kernel.org>,
	<george.mccollister@gmail.com>, <matthias.bgg@gmail.com>,
	<Landen.Chao@mediatek.com>, <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
Thread-Topic: [PATCH net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
Thread-Index: AQHaPxu37rZqu9m8WUeAEyFb9jzcKrDKg56A
Date: Fri, 5 Jan 2024 02:42:24 +0000
Message-ID: <ba7897934c8e42590420c278c70ac773a25afd6d.camel@microchip.com>
References: <20240104143759.1318137-1-kuba@kernel.org>
In-Reply-To: <20240104143759.1318137-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8033:EE_|SA0PR11MB4671:EE_
x-ms-office365-filtering-correlation-id: 5414f0a4-3778-4c01-bcfe-08dc0d97f2cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bfAuTwFS0mHB6zTyW4nj7IQ3Ajm0NFxdfBB/9G+69yd9BCjBU9UbJvYp0pmYMBu1xAqgk7S03q9ZWUQjQwl8+R7LNrNe0rZdGi4Wf9aFJrWIQHLuOiRXTf1xN5bs6l3MDct1QqkRgJO0bHyOI7e2ciDM1vxoUtDFyMkvudyLvnf/a0pMMEsTcSMFJ2nyXFc2aIHj5c3+1EeLNy2e8AqAwfxYPbt+7GYvvOjWjg8x9wbg5eZz4ABwImw95ltCOcJBi7KiqOfotSl10gLDjgWwcW16G0eyEEnSiydvgi777IZMKiGW8CpgM7Z3KoGOxW4qPWxEqsRouueLYmXDQh0gS3xK0iPmGcnINRfqjHEF1FFT8Vfzl9RvLJfIgaXhA3mx5YIso/VVsfldtZhZFFVb5ChCGrKobQiFwNSuIjHGHHoA8l2TrsNUytQL51K50llggzhMw9FH5yN3wu/k2zM6yoE5As4ImCPg+DBJSaK5h/6pwyEimfyzM+yd9kCslmpzXa+qij29pWWQtO5HtdDQREVOZRPpsaXH0dtZZ6W/pl7UangfpE3Wvn7rcG6LXRH1Ix4em6Re3n0sW35vJdAT/0StFrq8EvNq2gKFRkabRXywSW9sgedunpgbOGIA+2bx+52eo5Wn0vztB4PXyPS38BJk0aEACZnAaFm6eeA4g3w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8033.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(26005)(122000001)(38100700002)(2616005)(6512007)(2906002)(41300700001)(8676002)(110136005)(8936002)(54906003)(4744005)(7416002)(71200400001)(4326008)(316002)(478600001)(64756008)(6506007)(66556008)(66476007)(66446008)(76116006)(91956017)(38070700009)(6486002)(66946007)(86362001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mjk5ZXN2OE9jY2VlSmkwd3FSQnJDOVUybnV1c1FNeHJPYVprMVZUaFJhZ1lk?=
 =?utf-8?B?Yit3YVRSMFlaSUIvWWM2Y0REelVVcGIvc0tXL0podEFsb2FFanlTeUtCaG9n?=
 =?utf-8?B?YkQyZHJoMHlUNUluZWRURHZMWGplMVEvZ3ZmUUt6OHRHY3E0WGFUeHhIT2J5?=
 =?utf-8?B?TnpnV2FoR2UvZ3Y5ZHVUNkZHbDRsejVEMVFxM1FaMW5WaGVLWkNYcVliSkRR?=
 =?utf-8?B?bjhVcFh1YUFzTzNBcmhnVXhJbnoyejNQdVVXSDFsVnRsUGt6MThxaVVYdmJH?=
 =?utf-8?B?cThMbjBTOUdUT0ZhbW8xT1FVSlErOWh2aXl2RWwrTlo0QVBNNzZzZ1VTTDJ0?=
 =?utf-8?B?OThvZ1g1ZnlTamZneU1WVnpVUkxmQ3ZFVWxYelpIOHlIaFEraVBQSkdWdWNH?=
 =?utf-8?B?dXJLUkxBZytsek1YWVorMHJOUFpVUDhWVE9TdnVyeVJPK3VyaXhJdmgyOXds?=
 =?utf-8?B?Tzgrd2J5bHh5Uk9pUFREMEJNM2FQOTVCU2hXOWpLei9LNnZqZ2tQeStyckIw?=
 =?utf-8?B?aFlYUjl2THg4dDBUUkw2WFBnWFY0NDUwci9IdGtzTUhRYldOOEh0N0x0TjBV?=
 =?utf-8?B?bm90Mk9ZN1hwSHRUcHV1NWFYajJxU1VxVERpOGxvR25MKzZ2YkN0SUVCSkZl?=
 =?utf-8?B?RkZVTTJPNzE3aEtKT2NUVWNyNmIzVUdrRFM4N3BIdWpHQlNISjNxWUc2UVJ5?=
 =?utf-8?B?QUFvdU9uMWxaMUlCR0tTQkVNM2l1V3RwQWJxQURodWdEVlZiTXV0YTFRM0RL?=
 =?utf-8?B?UFZOZlZlTjcxc2s3Yjc0MjVoR242cS81YUVMV24wTU1ucWRINmozb2dKRUFx?=
 =?utf-8?B?aHUvRERMeHIvQ3c0bnhHV0lDTHRpR0oycXFGcnA0VnMvVUptSTF2M3c2b3BL?=
 =?utf-8?B?ODZqTlNIUWExTlFJZUlkOG5scmY1bXpjblJZVWs1QkxmemRNeFpVQ0lKeStq?=
 =?utf-8?B?TGZxSC9SN0F5Y3A3ajRod3FtSFZoOEFtc2RoT1diVUlqQnpxeUlWSWdZR2dP?=
 =?utf-8?B?ZHQzSytxYVpwbWEvTEtFMExaZVVlTHlraFJKcUdHUlN6R0FYS1dmMmhpdHVJ?=
 =?utf-8?B?VDFsT0NNOSs0MVRiMmVmVVl4QWpYQVYrcXFScldPdmYrcHZMNkppNmxJcnpr?=
 =?utf-8?B?RjFmSXFOTFpzZTZXMU9JdlFZUTFpbTl0Mnc3cWdiaGhvUnVwVndma3pDZmZt?=
 =?utf-8?B?SlcxV3FJeUw5Q2dYeGFMV0hUQzNvc2lOOHV3a2lYMkl1NFpRNlVrU215Nllm?=
 =?utf-8?B?WlN2NFdtcHFCT3lSVHNJeS9IRktXbVQ3bjFLSnJkMENqbEF1VFpzMWU1UmlF?=
 =?utf-8?B?dVkrYkNiOGRucVo3SGVnYW5lcW1MYjV0MmJYSVZBVVRBOS9PSk5uRk92Tzds?=
 =?utf-8?B?WDBhZUZEZWxiWEZMaU1yOWUwV2hTUGR2UGlQRTcwcHYyZXE0eHhkRVFqUTZW?=
 =?utf-8?B?M2JtQUR4RmQ3elNRbHJ1dE44QkhUVkRDSitzWjJlSVp4TG1VS20zKzBYUWVO?=
 =?utf-8?B?OGVJRGFKZEZNQkhVcEVpMUE2NXF6WE9RYjAvVjFkaUt6OHJCWWtSay9RNmkv?=
 =?utf-8?B?bzYxSDNjUzhacEZ1c2g0Y3pvMFNuelJDcjExWXZEU21taFVJZk9wV2tzYTVO?=
 =?utf-8?B?aFJrUDhDQk84SmZmNGVFRjBLL09WQWttY05JMVMzTnRjVlJVTzNENWJ2SVFM?=
 =?utf-8?B?RnpVVU4rWE1xWmJhdjBHWE5qN2lyQnRST1B2aVBaeWxzTjNHWTVheXRWMlV4?=
 =?utf-8?B?UFBRcnZEMkxvN1BnZGhoUEVOMjU2NGhSTkh1U2tUZk1vemNaY1VpUkYwV09h?=
 =?utf-8?B?UGpRdlJkRTdCOHNCeGhVbzB4WVR4R2lYTmRDeUM0dXJGMEJvd1hSYkVsMlRy?=
 =?utf-8?B?Y3pNcWNHNWJNYXNibDdicUpFemVUY2lsWW1TZG5sV3hmUXJjemRhQzlyQkhF?=
 =?utf-8?B?Qjd6RHl2Q2Z5d1kvMEpMU1UxdVFGamJ4UlIxTGl2dmI1VTB5YzlKZklISjFw?=
 =?utf-8?B?eU1zSGdVc1Z2Y3dLdGVXYmdQNERpZ0xyek1HemFIaytvbURpNVRaQkVIZ2NV?=
 =?utf-8?B?UHdyZWc1aklxbkVGSEFRUWUvaU1vK3JuVmYwQUg5NWs0T09hdzRVdnE4cDdl?=
 =?utf-8?B?dUlXb1grTmhMbVlreWE2blNNczVBRWV0QXlXbm1VSFRwR0JMazBwREJkbVBh?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6F9B93D5E231F43877498E7D9209DAF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5414f0a4-3778-4c01-bcfe-08dc0d97f2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 02:42:24.4578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01zrrmSmoB8iFX8m2BxRGXKDLopRcI25UWpRF1Nl/EXXsqxUxJAKKA03imn7e6NaqAVPWQcB3gS/G8as4OIR7TfSMOU6BepR+Jmea518S8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4671

T24gVGh1LCAyMDI0LTAxLTA0IGF0IDA2OjM3IC0wODAwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBXPTEgYnVpbGRz
IG5vdyB3YXJuIGlmIG1vZHVsZSBpcyBidWlsdCB3aXRob3V0IGENCj4gTU9EVUxFX0RFU0NSSVBU
SU9OKCkuDQo+IEFkZCBkZXNjcmlwdGlvbnMgdG8gYWxsIHRoZSBEU0EgdGFnIG1vZHVsZXMuDQo+
IA0KPiBUaGUgZGVzY3JpcHRpb25zIGFyZSBjb3B5L3Bhc3RlZCBLY29uZmlnIG5hbWVzLCB3aXRo
IHMvXlRhZy9EU0EgdGFnLy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpha3ViIEtpY2luc2tpIDxr
dWJhQGtlcm5lbC5vcmc+DQo+IC0tLQ0KDQpBY2tlZC1ieTogQXJ1biBSYW1hZG9zcyA8YXJ1bi5y
YW1hZG9zc0BtaWNyb2NoaXAuY29tPg0K

