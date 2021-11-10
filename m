Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74CF44BE53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 11:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhKJKRH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 05:17:07 -0500
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:55472
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230117AbhKJKRG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 05:17:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXtyWG9v6DrzNvD6V/0IAuTEN9GJhCGT/BxNTB7sJv4CTctZuRUkT/GcTgAF4Vzh4Th5BWUODuKJZ3IZV8uh6UZPeTYvgmrI+y/HLUsPRYAa/InkNGUY42jgiLFqA3PHeyfZncDkBDK+1Ci5KIlTxxThFiAABRIBeKU77KEAGZP8f+AHav4bBTxFhvqCaeMp/X2RCIXAIQSaScoI7fRGLsgKsE2JoVgZI0IJWJpQr1R+WX9hO2mreWsnGlliixbh7OAmam52Tfr/rbg13PipG7faH2QUgW4rnCdIfTMge3yS8qyneXL6pCcF1ht/QFBEUUIYhMa3bqmVDS3WjXP0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/oUxj3BMkCSlPZkpnXFRhnv76FyO7gnb7qH5FSORpU=;
 b=mEVqSFgqFtIa2qPg3X+xDz2vYrC4wRFr8i+KNiVdbTSpJFZ32ta4qXJGdC+HlAKP2Od8JvpvzNFyjPYXSRCnObGPwdO5xW/74tgzh0LmdSWhdaHco2CoRW+11j90drEM4emHnhIWr8oHoom5oxDc+R1TCXceN34t/H8ewdpfOtMY76t5N7XSweoC+DfKZPjhrl1+6zUkUKQsUmukVycKFKWlniJyB/de02WE4LlRgrIcoDRAol3l5QLmHYBGXeKOEYvaptZ7vil0adx1gkDwGMA1u2UXfw4HWQhoRlTR8p6+ZO998UVNB1XMlpgb1XENepnBJ9X8+FIbRfrw7y06rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/oUxj3BMkCSlPZkpnXFRhnv76FyO7gnb7qH5FSORpU=;
 b=BRHmfyThzLYFJoC6PzjInmggKWhMgitPVeRX31V3KAN7Ml5fJL9QU76M1FZdrmhJZ7ff+0y1entWR35+F7gkmH/K+H4DnyNPeLBpCJWvth6w972LOapfmo5XHBh4VABIy+uT134NkcxWZ9IaV/jBeol5A+q+NDZx3wdR0YUTvnI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2802.jpnprd01.prod.outlook.com (2603:1096:603:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:14:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:14:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Topic: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1g1yrO/DEDK5GkyhMVfA7q3phav8iOAAgAABiUA=
Date:   Wed, 10 Nov 2021 10:14:15 +0000
Message-ID: <OS0PR01MB5922DA080AFB0AF97228275786939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
         <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
 <47a188dcc1a16e6147cf403b5ce7781646a87203.camel@pengutronix.de>
In-Reply-To: <47a188dcc1a16e6147cf403b5ce7781646a87203.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efb57005-03f6-4f9e-d079-08d9a432d9c9
x-ms-traffictypediagnostic: OSAPR01MB2802:
x-microsoft-antispam-prvs: <OSAPR01MB2802A399A900FF53686714EC86939@OSAPR01MB2802.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Y7g3q42WTWism9JMq+06heDlqM6gzWuiki00X8NFuCFWgQQyQAgRsVE61KxtkBVt97gnvOVr+uFSSTPALj/BSfgeIq1ILSMMJ8G3K8bA+BcyeXxM+ZgxuX4fVFRBmpbE5bxyBk6trXDXINgH0vGTKRz18j8uJDFq7qjj3bBEnbECpbfDLmMv8WVsnqfMyX0iUHIYvAoUOuvTFNeJs+sXcaInU1DJQDLBOVjdQNqO5gEwimcn7tSpSSi16Xw7NxTgNW8f6t+JRq6WgcVYTG8jfWsKuuu51CKNBmwZntO7X2i3+9gALIf/gXHyrT3K65JZVVsuaYajXoUiDOSAx6EoiMFqUUPVJM/d1pkmWzVvcglxFEWij21mcVUhtJv9FRCQAM7Oq6IHrdXe7GuOJUJQ+aTn7TC7OtkwnhcWo6clIvBtdwxyJ/ObbhfpJQsMyN5OtGk0KbXpE/5DCdonxthOXwcLqWG9GYgn0vb274vKiZaVbncJXtwsjIl0CjQnHKilmNVxyp2sbhs9sUJdGxIehoqxtrkqaTtKyybIikIKM2PI4FuZrvJMvQCmndm96+HKUF/6TC5QMHjOKhzejVGEMei0thooxGpPBPXgaIJMKfa6B564tMs2UrhkeFW6+nDB9zvQBYA7cVN8sGSQ4WhSm/ha7FEd7DEGCIBSEISClM1AgHSrSLCAPMPa6az7ooEOSTLVjRAJ9vK8+LBvErI4A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(38100700002)(4326008)(122000001)(86362001)(316002)(54906003)(186003)(110136005)(8676002)(8936002)(55016002)(76116006)(5660300002)(6506007)(4001150100001)(2906002)(66446008)(71200400001)(508600001)(38070700005)(64756008)(52536014)(9686003)(66946007)(66476007)(83380400001)(33656002)(66556008)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJrR21ZWVhYZldnTW9KeWIxOEs0WUZVNDk4NlBHM24vSTJyZ01TOUVJejF5?=
 =?utf-8?B?L0ZCTDkwNVlLZmx0RHNnQ01IK0RyQVVBcWVqbUh1UWREMEdLVEZsTWlEZzBi?=
 =?utf-8?B?aWswVTZ5SUtXMXB5dTNpaWFxYmtEQjRkcDlTR2JEZEZWY3h3NUt4QWlJVkp0?=
 =?utf-8?B?N0gwc2NTeEZ3WCtIM0UwMzE1ZTdaS0diOXFtK0Z6eUZyN0orOERVdEU3OVBv?=
 =?utf-8?B?MVNYdFd1Y2crTjJTeDg0dVNobzk5UmwzeVlkdnRwL1Z2VE9mRkR2WGNLYkhE?=
 =?utf-8?B?SHROOG5Xb3Btb0NsaTgrVE8reUFmZ0xsdkZ1NUJBeEw2blZYRzhHVjBqVGZw?=
 =?utf-8?B?OVZKaWtET0RJN1hzeE9JaVFrMC9rYm42L0lmMVRpWTBOTDNybXMrbkJQRjRy?=
 =?utf-8?B?dTd3YkVrZTZ5emVSSmVFNTRHZi9VYkxUaUdWQmFudkFzcXJ2RW9CR2U2TzZj?=
 =?utf-8?B?UWdKUkJBRm1ISloraWRlQlJJKzZaUGN1UUZrZnhDaWVoYVpaNkhJWkF5Qmk1?=
 =?utf-8?B?ZlI3SVN0L2o4RjU5d000VGtjeHdaWnc4c3lLcXV0LzVNelVmOTBxNmo3aEJt?=
 =?utf-8?B?eEMvRmIxMTdncVA5K3hjNVBSRk5PZldyQ1JueXRiaFdDYVgxdW1vVFk5TWV1?=
 =?utf-8?B?cVZQN2h4a2gwRkVPNGlldDhTd1BEcmVLbnJ1UkNMcHUxUnpsdzRHVnBGR1Bt?=
 =?utf-8?B?c0Jhb24rb0cyV1Z4ZWYwVjhkZ09PMHp2SXBQZXBCZHRjazZiMkdzNVFTaGpz?=
 =?utf-8?B?OFRPRDNEckZDYXM5blFkQkU1dWt0QUw1aldjdituZWd0WFpMWkVLZzV3eUdH?=
 =?utf-8?B?eFpEUlZ2NGhYQ1hlVWtCbitWVmttZjBNdmorZkpKR1VyMHVSbmFnQWRVWE5m?=
 =?utf-8?B?Z3I4Z1luWExBUzN0a0xMUVBrWWtUcDBMbTVtcEJaY0F3TTZ3SHYwcnZNWlZH?=
 =?utf-8?B?RmsvMDRTeHh6Tytuc016NjdmNlRMRU9rMnp0Y1dQWWxMa1NNRjRTY3JjcGZs?=
 =?utf-8?B?K1IvSkhlZXM1WVVnMWU1QjV6MExPZEMwWUJ4UXU2MVdaRzhhOGtBdlRlWlVm?=
 =?utf-8?B?VlVOTlluSy8wMXovSTZSQ2RFeTlqNUIyVllVZjhGeUliOUpSTy9vRW8rdlhS?=
 =?utf-8?B?V29sMk1LMkRTOUVLeDFBR1NIQnppdHlQOUlSQ2RTVEFhandOaXRjeXJXVlNK?=
 =?utf-8?B?OUJxcjE3eTAyaW9taU0zVWtzNXN5d2dZT0VsQ3lSc0hXTkRXTzlaVW5vSXM5?=
 =?utf-8?B?SkdoZUwyUkYzNEE4WkprZ0tJTXVzSk5CZXYzZS9MQSt5dzRDbW00bENQeDV6?=
 =?utf-8?B?TFUwLzVLV2lMRU1iQUltNElnaDJYVjVIbDVGYU0zWklxYW5SMXZLVENLVUZK?=
 =?utf-8?B?VnlHSUN3ZVdKdThDNjdEWmoyMVROTUlHcVZlWG1lZWFVSTlNeFVWY3JQWmln?=
 =?utf-8?B?Z2FWYUc3SWZYUkxLVmJDNkowYVRGV1ZkaWZqS2V4MGk1VWVnU2JoZGVzVmtQ?=
 =?utf-8?B?ZTQxQ0hvY1Vva05NMGREZTAvejBmU2VETnB5RUc0UUpFcHJrQ3crUTdPTURV?=
 =?utf-8?B?NzVSQ1B0aitIVktQMnd6SldYZjhGY3c5emduRjRZTmR2MmJBRkZvQ0Vydnp2?=
 =?utf-8?B?KzcycWNlYkpvdzZQYnZEL0lOb0REb3NiVWwxZ1FMc0tFZmpPUHQyVENmNVEr?=
 =?utf-8?B?dkp6aDA0SXF6V1NYYzZqSXJSS2xUU21kZm5mRGJqYTVVV1Q5SkVZOWdqZmlj?=
 =?utf-8?B?NnVrQmtxMnZUY3dDcEpWeVp5RzM1K1ZkQVhMc0d3NVZaN1hETkFvOENwcm0v?=
 =?utf-8?B?bnFtWUwzRnphUjM1aW51QjZSc0tCY2hpZmRleDZrT2l2b3lsY1pWVTF5ZzNQ?=
 =?utf-8?B?UXlFTnZma1hoUHBJdVh2VTQySWFidFNrTlFwRU1vM09kRXNxVmZOdnFlaFJM?=
 =?utf-8?B?MjlGc082ei9UNk5hSlRUZ1hMczFLVURNcm9NLys0cmpYY1RSdy9ib2o1Wnhx?=
 =?utf-8?B?cmRQWkJHZys2WlAydk9uTlRSU2xETmJNMWFxYnhieWJ3WTdDaXBwU0VicGp0?=
 =?utf-8?B?UFQxU0g4TmRqVE9kSWVod1lPTXRwVnNXUVVkNGVYQmEyZCtqbUlmNXVuRmRU?=
 =?utf-8?B?MDduNS9BSzUweDVmRXRTQ0V0WmV3cUhEYmM0ZGhVQ2oyRGFUOUplWER3VDFD?=
 =?utf-8?B?d3JnemVEYWRYWE9wUktWcDZGWE9DcG9VSjROanZkdlpBYWFXVEJ5WHZJd0ph?=
 =?utf-8?B?Qk5FSTNvYk5TRC9VV2d0a2s0OU9nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb57005-03f6-4f9e-d079-08d9a432d9c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 10:14:15.6906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8Z0awhOszmsLNck37IiyDTAO1Stf/3Ob0ztpLP9SbKo8E5W9LVUKjtQVi+2iOVaNfAbl7Zae6YXdJOqHIjW2V+OPinI5hJATWSb3WZR3Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2802
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbGlwcCBaYWJlbCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyLzJdIGNsb2Nrc291cmNlL2RyaXZlcnMvcmVuZXNhcy1vc3RtOiBBZGQg
UlovRzJMIE9TVE0NCj4gc3VwcG9ydA0KPiANCj4gT24gV2VkLCAyMDIxLTExLTEwIGF0IDA4OjMx
ICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gWy4uLl0NCj4gPiArI2lmZGVmIENPTkZJR19BUkNI
X1I5QTA3RzA0NA0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBvc3RtX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5k
ZXY7DQo+ID4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwg
TlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJSKHJzdGMpKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgUFRSX0VSUihyc3RjKSwgImZhaWxlZCB0byBnZXQNCj4gcmVzZXQiKTsNCj4gPiAr
DQo+ID4gKwlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdGMpOw0KPiA+ICsNCj4gPiArCXJldCA9
IG9zdG1faW5pdChkZXYtPm9mX25vZGUpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCXJlc2V0
X2NvbnRyb2xfYXNzZXJ0KHJzdGMpOw0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIG9zdG1fb2ZfdGFibGVbXSA9IHsNCj4gPiArCXsgLmNvbXBhdGlibGUg
PSAicmVuZXNhcyxyemcybC1vc3RtIiwgfSwNCj4gPiArCXsgfQ0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgb3N0bV9kZXZpY2VfZHJpdmVyID0gew0K
PiA+ICsJLmRyaXZlcgkJPSB7DQo+ID4gKwkJLm5hbWUJPSAicnpnMmxfb3N0bSIsDQo+ID4gKwkJ
Lm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG9zdG1fb2ZfdGFibGUpLA0KPiA+ICsJfSwN
Cj4gPiArfTsNCj4gPiArYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUob3N0bV9kZXZpY2Vf
ZHJpdmVyLCBvc3RtX3Byb2JlKTsgI2VuZGlmDQo+IA0KPiBJIGFzc3VtaW5nIHRoZSBjb3JyZXNw
b25kaW5nIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyIGlzIGJ1aWx0aW4gYXMgd2VsbC4NCg0KSW5k
ZWVkLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiANCj4gcmVnYXJkcw0KPiBQaGlsaXBwDQoNCg==
