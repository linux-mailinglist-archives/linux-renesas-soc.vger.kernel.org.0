Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85469382D3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 15:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhEQNUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 09:20:44 -0400
Received: from mail-eopbgr1310135.outbound.protection.outlook.com ([40.107.131.135]:36162
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235733AbhEQNUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 09:20:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT9ta41q07qGaSGkXj1uAiiZZPA/02pypBrHzEasWXU7OUHt1Lwa7NmRNlTWpGCebjyR9QVVq0OBFXgpHTfrxu9pXCVRgo34/kwW8nyd7wFMv491DJrhFucb2q/X19eDVewHtpmKH9BSxLofJS4KM+WRaOC5+6ElqKRvBqeEbaWwq7nLqs6c0wvs9npnLsLP+hdXS0BgXk1ddEKXVlFaK/lpPX+mEx4h+URv8igpB7YBUEZ4oeDzYfPWGS5rSPTIG2xybAMJIsDCubFZKhMpUUCGbW92cqo61QCEuI2xeuFhOpO4T8EizztMJiy81AdxhOpHpw13NC2eQoy/ML7eaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwaKQyFjj5exxaOy/yzyYZLmArJh322aO/+43jrpTsg=;
 b=KXQFsg2LwEdDHjzRKrrnFHEXEJbU8d6yMXWpFeBJZ6I4nZpCxlaYU8GHFo4XTfp09zkn6XIKP/TJ6YVVqZtwqquMjGUJu9NZ+b/DnN5fDKu5IkrXyVi+hP89MOlPAO1tY/ZF7M/lCU9MzOeJYP6FfJxA6BjaTo8fuvLMJWVPqwzuIeMZni6YaSsEr2ajsO2dcq6IYbrU0GbGo7TrXQ7Z22aAaqgmH0x0gJ/MipWKpK9bM6ZUcoMYgIEoiQ4vPbnFFAJfTb/XiLbawssiS54qtjsFeb48ZLrM5zy+txp6M5CCgw9DTU7vLtxMUi9zE3Mg1GQurgVCTmLIgWEY4gVPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwaKQyFjj5exxaOy/yzyYZLmArJh322aO/+43jrpTsg=;
 b=Hzp6E0MaLnMQwwK3mq1QKYsWhqqjL2L0oC0dNn3wVKKdiGpLhJroykkcd7uZaAmSwH7aZj38JPNEowKfjw04+7dLZBosEX7fNdsWvg4iso8yF2k6W5BOw2Z9RS/fX2yfEYnp/wE8TrQFAxrwZGGr2xKUYrSbQqfdNHUkx8PkG5g=
Received: from TYCPR01MB6319.jpnprd01.prod.outlook.com (2603:1096:400:7f::5)
 by TY2PR01MB5178.jpnprd01.prod.outlook.com (2603:1096:404:116::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 13:19:24 +0000
Received: from TYCPR01MB6319.jpnprd01.prod.outlook.com
 ([fe80::4de2:d9e3:a835:7bc4]) by TYCPR01MB6319.jpnprd01.prod.outlook.com
 ([fe80::4de2:d9e3:a835:7bc4%4]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 13:19:24 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Adam Ford <aford173@gmail.com>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: RZ/G2 Lossy Compression Memory Question
Thread-Topic: RZ/G2 Lossy Compression Memory Question
Thread-Index: AQHXSxtH2EltDngrpkWAkqDhbhnEO6rnpG2AgAAB7zA=
Date:   Mon, 17 May 2021 13:19:24 +0000
Message-ID: <TYCPR01MB6319B1280A2EB171A2CFF2538A2D9@TYCPR01MB6319.jpnprd01.prod.outlook.com>
References: <CAHCN7xKjHramQ=p74+jtLP0vV6=cTjMv-b7ad83W3R50aWc=rQ@mail.gmail.com>
 <CAMuHMdUsTouu0LAC0sD8cW-P1WCE0DcPMSR5iBaos_H2oOHLiA@mail.gmail.com>
In-Reply-To: <CAMuHMdUsTouu0LAC0sD8cW-P1WCE0DcPMSR5iBaos_H2oOHLiA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctN2YwMTdhZmQtYjcxMi0xMWViLWFhODUtOWNlYmU4Y2NjNTQ4XGFtZS10ZXN0XDdmMDE3YWZlLWI3MTItMTFlYi1hYTg1LTljZWJlOGNjYzU0OGJvZHkudHh0IiBzej0iNzQ1IiB0PSIxMzI2NTczMTE2NDM5MDIyMzQiIGg9InRkNjJKWHhmQVFrVXRIeGFtbUZCcStrRk1SVT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3807baf5-6f8d-47c4-41d2-08d9193663d3
x-ms-traffictypediagnostic: TY2PR01MB5178:
x-microsoft-antispam-prvs: <TY2PR01MB5178D7042F74571117A08BED8A2D9@TY2PR01MB5178.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4MtQbLsvwHOozagOwLtMlMl8cvzGNEivbLIEf5xBI1dc6ts3nh7t07Fbr0jmowIbBn1JIcGHFyZMQPJw/D3ILSSB08MfPSpDRCOu90eDFrRcE/LAdSwW04+EzHamcrEY+rTim/w8CYWFqzRFpmIprreehJcJkRW6vFOb63zLIRHEWRG6UmECf/LW2o8aROgbJOBD6YHyCBMZQcwzuU+06JWFmzAGlZkxqA54kk7kUjL9uLmFMCvtF3TYORXHoInnakyMbZ7LbBeh8aBo5AC2mB5lfId+5Z4lkyS9ASiw7mBLTVqgPoL6OJdDGzPDRGb6sAsGpXMEhctXkSMfTK1iTrE1XIX2bsLtQErv2ntCjbQr+nu2qVKObdhu6OfmuxbQnP0E7GqYlhCUACSQJmOfsLg5tzgxdreKD1qIMaQRSokVDEqN2G2w3kq3hRSujVb/uDtRwDrvgEw5K1zHK1r5OnI9wYIIQvhf9aTA7zQoE6sq4dN1pTKfBryZMBZS3GysWJjq6omm6xYGIhK0PxT5G/mwPvPS6sMdDIsAiMeglNwLObzpndV7U3bpr+hg6+W2wy9YvXm9wVfRxnOcuJYZVfyxGkk+KKhjO0OHbvF2CmP5vUjtFZp08VMEDeVoTVdtsshgDlyzaNh4lvy6fNK37uyAe/SJwVbl60KlydVM3HctioZj71SsFAR3lndJOBSnwpr4VWDO/Y5ULhqcK37IpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(26005)(38100700002)(33656002)(122000001)(4326008)(186003)(316002)(76116006)(8676002)(66476007)(66946007)(86362001)(4744005)(2906002)(55016002)(966005)(5660300002)(9686003)(478600001)(7696005)(6506007)(64756008)(66446008)(71200400001)(66556008)(8936002)(52536014)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NXJOczdNUmE1bjYxenJRM2Y3Rmplc2U5dmdOQWZZZzBlNDYzUkIwdG5zUmhO?=
 =?utf-8?B?aTVuQVJwSVl5d0hUNzVySmY5ZVFJbmRJdm1YRVVWdWxnSnZpNDhhbkI1K0FP?=
 =?utf-8?B?TjQxVmhWZTJOc0xSZVdCSWxNZTNtWjNtaFpVc2FTK3JzTWpMVTZWVlRuWFph?=
 =?utf-8?B?U0s2aHFMOUhFMDUyWmg5TnBuUFQyY25DOVJMM2Fwc0JvaldqUCsrVTdzL1Iv?=
 =?utf-8?B?dlRoZkNVV0V3SDVhcEVNN2dTYy9FWmo2bUU2Y2I0cy8vRnZ0N3ZKZk5jUXBq?=
 =?utf-8?B?Y1VBK2dyaUNCUHdFRVNnSVMrZ2I1TmlTYnU5S0RUYkEzMW1KTEFkMVkyUEVR?=
 =?utf-8?B?aTZ6QkFSRVdlZDhnaDJqZDc4TzRlS1l3VERHOUhpZFc4SStEK2FWQ2tlQnBE?=
 =?utf-8?B?SFpTTlZCaEoyRE5PSnNtV1dGdi9DSnZzclRQenVEejVGK3k3WjA1YnphcW9k?=
 =?utf-8?B?aDlMVnNud25WZHFOUHRSWUw5SHhjSEFnUHFNc2VYNVp2b1FRM1JreTBUQkR6?=
 =?utf-8?B?dHF0b0NkSC9peWt0RTdROWt3MEVGeEl5TGlrWjgzQWlzWENlcGdVdWZ6YURP?=
 =?utf-8?B?ZnZJY2EzVDRvczJvVkY4cENWZjVVcmRYc0RoOWN6KzdiRmVDOXIrcXB0Kzg3?=
 =?utf-8?B?cGJsaTRyRnIrV3RqbnphOW5IVU9SNTU3ekwvT3NiVFJNQVc2VStWYjNUbW1z?=
 =?utf-8?B?U2tRNkcwUExndXR5alo3Q3hQdzFmaVZmcEdkR1Z4dHBXdmFvSXlBMW02bGht?=
 =?utf-8?B?ZFE0Ny9pYVV2aEQ0MDM0d0ZPTE1Dc0Q4VGNSdFIvd0lQNGtmTERydGhOMEdN?=
 =?utf-8?B?a1IwNjRNaUVsVjZrRGp0S1l0ZGhaSzV6blJ2Rm1wUER2ZXY1a3k5QStaUCt6?=
 =?utf-8?B?Qm5KQ0xjQ2Z5Q0UyRGtCUkNmTkdGcFE4RHd0QnBwelVzOTVxRmd3aUhiZ2Jo?=
 =?utf-8?B?c1E2Z1FPdlZ2VUVoYmFRc3BoOG91TnNSWXVUcjc2Smh5K3NtQmx5cVpaSGdj?=
 =?utf-8?B?cUNPOHBBTFRub0Y3cU9zbHdYL2h1NDdCb1poZUxnU2JReTBPZDgyQkVMa3hF?=
 =?utf-8?B?bDFiQm1va05ieURudzVJd3hwWklScC8rc0NxTFdFK2ZpbFJkd1E2MUFJYVpv?=
 =?utf-8?B?b2Q0SW9LNktKSm1PY3RDd3ZyRTRHTnhTNlc3dzhsejZQbmRLMVFNUER0eCs1?=
 =?utf-8?B?RHgvak9iTllXS3F0Y3ZnM0c0ckd1c2dwMmpTU0llaGkyaHUvalJqWEVpc0pK?=
 =?utf-8?B?aDZXL0Zpak9Zc3FBRXdEejgzM3QvUGo4UWx4RHlJMzB0Mi9RT2VZZ1E4N25O?=
 =?utf-8?B?OFZLbytSZzJHeUxQcUFnRkZHZ3phY3JTdkFZSU9xOG5MZkdKSnhxNGpOOHVF?=
 =?utf-8?B?NXRoQ05VYTl4Q0Z2Tk5OSDIySG1La3drQzM3QVVJbHVoWmVhVlBBb0pibjNy?=
 =?utf-8?B?MU9QLzVQbHBOeGx4UEdvN1E4eWRTK3JZSGZVK1piUGtJbFl1Sm0zNGhGb3Bh?=
 =?utf-8?B?YzBtR0Q4K01PQ1djQnFNUko0WSsrNXVQNkRZb1lEUUlFUnBxeWVJeFBiczRq?=
 =?utf-8?B?Unk4ODhGZWVoclFFdXREOXRQTk5uT0U3ZWFTV3dXZy9ncE5zRjBaSW5RaEU2?=
 =?utf-8?B?bjJVNTVXQ3VhRC91N0dZNXlCVys4S0NpdVZTOUh4L0NKYVNOWWFWWE9QdkN6?=
 =?utf-8?B?bVBUYUZxaGYrNXdrRXQrSzJBOWUzK0NDc2RFT2ZvSnlZeDlVTDFaQ0VMYXNu?=
 =?utf-8?Q?enP1eQyMD6rM2P+YQQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3807baf5-6f8d-47c4-41d2-08d9193663d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 13:19:24.2318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X85Vu1Y8BO++fA40ojOj8jiKNskNWZCfB963LAQ2UBbVotDkRnIHJAoZoXQX9THhMF7yTS8uBXCM+rsnMPy1FyCTLfIgywMm4ScL96V2HFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5178
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIE1vbiwgTWF5IDE3LCAyMDIxLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IFdoZXJlIGNhbiBJIGZpbmQgdGhpcyBCU1A/DQo+IHJjYXItMy45LnggaXMgYmFzZWQg
b24gdjQuMTQsIGFuZCByY2FyLTQuMC54IG9uIHY1LjQuICBJIGRvbid0IGtub3cgYWJvdXQNCj4g
QlNQcyB1c2luZyBhIGtlcm5lbCB2ZXJzaW9uIGluIGJldHdlZW4uDQoNCkZvciBSWi9HMiwgdGhl
ICdrZXJuZWwnIGlzIGRpc3RyaWJ1dGVkIGFzIHBhdGNoIGZpbGVzIGluc2lkZSBhIFlvY3RvIHJl
Y2lwZS4NCmh0dHBzOi8vZ2l0aHViLmNvbS9yZW5lc2FzLXJ6L21ldGEtcnpnMi90cmVlL21hc3Rl
ci9yZWNpcGVzLWtlcm5lbC9saW51eA0KVGhlIHBhdGNoZXMgYXBwbHkgb24gdG9wIG9mIHRoZSBD
SVAga2VybmVsIChhdCBzcGVjaWZpYyBjb21taXQgcG9pbnRzKS4NCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NpcC9saW51eC1jaXAuZ2l0L2xvZy8/aD1s
aW51eC00LjE5LnktY2lwDQoNCg0KVGhlIFRGLUEgZm9yIFJaL0cyIGlzIG1haW50YWluZWQgaW4g
YSBnaXRodWIgcmVwb3NpdG9yeS4NCmh0dHBzOi8vZ2l0aHViLmNvbS9yZW5lc2FzLXJ6L3J6Z190
cnVzdGVkLWZpcm13YXJlLWEvdHJlZS92Mi40L3J6ZzINCg0KDQpDaHJpcw0K
