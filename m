Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09C500C48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 13:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241898AbiDNLmD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 07:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiDNLmB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 07:42:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9AE5FD9;
        Thu, 14 Apr 2022 04:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGrb4lSKOFG33HRkTOz71mh9mBG6hrNwW3y6BddTDe5AqZsZ6JsSI9rlC7kq7y9b/pc/7VM6vRaWNL72LYchD0z8hUPOdDQzyfqV4MrRqeIq6erK8nnBsrVUbUJ3V8X2ndETGakx+yiu5JwEdGayhVom9u61oMGA5J8/JWTU9vyPo1m/+YZQB5AftHtce+dH0r/ipNHZ+m/wyTb0jyOPtmQJx/oslMauEtkAZZf8qBOZzUUOxRfrwZDKjcax2jW6aZCjpE7nmjZ/Klg3biCyyLGkNViv0gJx3LECjFjBN6gZVwXTzBakMH//qvnpNeXqf2oMhQuJVDaABZYHXaWLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5Zew1iKdDonmKiR3IZVxlEBKLlf3tm367t/lzCxJII=;
 b=XweczqQTmnWJxMTJggqiHXKRE8uzy4AJNL7132DRyg0NRLo5sXrkqoAhfbJhK0zUi4yxVrZ/x7iMwj9fUzzLf16OA9WqYEg8hJzB0k4Zz2oQ/ysocJTZ7YWmq6GUFpPGBi2WIZCluZNzbh3fx3gvFywwtJ4BOestkEAIQ5WVkUkWlNqVsaRLSYTPAHTpVdcBzDEO9yAsiLrFu/liITkwtbqxU0aQrtEcNMRYJBqhqZzokULfx7CnOc2bejxH6+7C3s2C2kykFVhnPuoJfDDSpjyBWK1S8eqnixpCPGuD7jtDKws8bCWl8KlvEYBVYMjop02aSlZNzJ31F3iIGzG4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5Zew1iKdDonmKiR3IZVxlEBKLlf3tm367t/lzCxJII=;
 b=MhV5QNQWjOSxWvQdxKYzRzkOvVt3fNSzGTi8/OHbalfIyjbdSUqQsleyNDJXTUvvAztAYSZT6lwM71NaHsfjyDowPfYfCy4RzDg7gA8Msvn1M8/KvIyx5GQCcb+FZdQ0vpk+pQcCXYTz+QyBoNPzZ8R/pJ7eSiBucuUNKSoGHos=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB3540.jpnprd01.prod.outlook.com
 (2603:1096:604:56::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 11:39:34 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%8]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 11:39:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC:     "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Thread-Topic: [PATCH v2 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Thread-Index: AQHYT6fOwDUQPFAp9kiYfcAKD5DfLazu060AgABQKzA=
Date:   Thu, 14 Apr 2022 11:39:34 +0000
Message-ID: <TYBPR01MB534186E5B431B7ADFDA3C772D8EF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com>
        <CGME20220414023154epcas5p1ee8179b447bbc1a9d079f58dc6925b7e@epcas5p1.samsung.com>
        <20220414023115.4190736-3-yoshihiro.shimoda.uh@renesas.com>
 <010e01d84fb9$80891080$819b3180$@samsung.com>
In-Reply-To: <010e01d84fb9$80891080$819b3180$@samsung.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90437bca-a1de-4124-c005-08da1e0b7283
x-ms-traffictypediagnostic: OSAPR01MB3540:EE_
x-microsoft-antispam-prvs: <OSAPR01MB3540CADBC8D99A99E6C75655D8EF9@OSAPR01MB3540.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kuXWzppXQOGVZsStLMrDLR/IZqyNbUUxI/L8AAxvRweLTHc45FStWVPwcFdpqm6WLeHQYc078A1J0myQ49ZbWwz2JRi1Q55PXvtSDImbO54jWwUqejMCwmTv0r0Smr8OYIUlki+fQDJuHjHUr4rVEkFe9yBDyjhddj1StWu6l8ilM1BHuOU4y85P2YDz0dt6QotPxTkNGGNDbsm0Jb82HEqBApEyHEv19pY249WN3z9zYPQnDHFCyFGw7Kq5URl55UXnLwQmeXbWCOvnLvBYFei2CiRfxXQieK9JpUeCH4/H1VZI1PqhaNLNuOSZO3PYL8RISiDxOV15Vr9CdKO5JOjtJW053Xa8v/0A21/cTpl2MkjNDlOwE+xNriXNghgDMOT+EQ5bc+K12NECMEZ/4fOekCRnXqbEmD+VNJNLTun9cFl0i1R/YGsjKYw+GQRs/DUR1+1uTw7ylfV+AqHD2XKDIuP9WZww7TL+PAQLbok0XSS201EP6bPQJpoZ96hcnYXfl3SNKfF6MNt34dHTdvXVZ+lKatHwZrLM944HUIz7gWTVqiFx/7U/xyvv+XpXF3epGcowlbU4rQiZ5A4sACP7M7KMWLxUBei9AdRVN9TysBdaMuvkilXWscWag21IMax+696uf0h2LYGrEiAFeaOEAMv0WGR3IMi74IQUGRPgnlDEMsyo1RSvbePk8b9/pqbjr8OEzVcTtiUAvJJE9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(66446008)(8676002)(4326008)(86362001)(55016003)(38070700005)(38100700002)(316002)(54906003)(110136005)(71200400001)(66476007)(8936002)(52536014)(5660300002)(66556008)(66946007)(83380400001)(508600001)(2906002)(7696005)(6506007)(9686003)(33656002)(186003)(76116006)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXdGdmxtS0QxaGJyQmZXblNZU0pyRVZHV1dhRmc1TXBXUUJZaXdGSmxpeXJl?=
 =?utf-8?B?Y3U3ejl4anpzRnVTVkRFbDBtaUNDbXhBTTk3d0VwdEhjcDlBT3M0VCtRRG5h?=
 =?utf-8?B?S29nelREYktyZVhtY2FjYjRrdnE4SGloQ1JDZ2daVGFaQUVhNlhIb1J5UTJs?=
 =?utf-8?B?Ky8yMlFyVEdVUUlnRjM5ci9HV09VM3VXZy94YXAvY1ljdWNwYWJkM0ZtOHJm?=
 =?utf-8?B?WmNYME12UFIxbjRkWnhPOEMvWCt0Z3dxUkkxSExWMlVuUG9vZm1LUXFXTzUw?=
 =?utf-8?B?OHgwcE9INmRFQ3FacjlpYVFLM1JrUjFxeHgrNHZ3aWV4Zy9wSzYyeFNkSUJ0?=
 =?utf-8?B?STh0RGV5a1lOKzNzU0pUdXEzeEFkam9YSzdUTkd2SXZMYnFiM2FrMk5DWnhp?=
 =?utf-8?B?eHlnNzdnMWI3VkpmbXVuUzRoRXdZZzNUNmgwRDhTRUwvaVRHanp6NGhrUmdk?=
 =?utf-8?B?YkF1UkhUN2pMVElOMGxUTGowN1pGZ1EyNy9TSndQWkhEK3lYa2hlOVNnK0pD?=
 =?utf-8?B?ZGtqUlVPcldQSjhYL0tMSGpraGd5VHZpL3ZBKzFwOUp0NHhVREZ6ZGN4TGJp?=
 =?utf-8?B?M2o2WS9jdWQvNi84QUpLQ1lPZDZVS2JtSzhlYmsrVkpObXJiaG9ab2RXQVUv?=
 =?utf-8?B?SWhOT2V6UjRCZWcwdmtwUC9OdTU2Ym1Sd0lUMDVid0h1Y0MzM2YvMWYwRFpF?=
 =?utf-8?B?RE5vZXRqU29CTVlmVUVHTWhHbmh4OEVhK2JXbTFzS3N6T0Y0UTRNamZlRnJY?=
 =?utf-8?B?YWJhWE9YVHNDbTNBVm5ib0ROVDE1SDRYb2RFeHNvV1ptQWpOV1ZaYnJwN3VI?=
 =?utf-8?B?THg4SXJLT0dnbFZ1NUtLQVRiV1FQbHhoQVVCTVlSTTB1WU9ySkJpSWx3TWJw?=
 =?utf-8?B?aGVnZGVZN2hKc1NVbDJYYVlnWHNMQ1ZhNlpoYUpXeEcrdjhRaXQ2QzErZUlR?=
 =?utf-8?B?Y2NkYVdJbU90UDZVOHU2SUJWbExlTnA3OFJiNUZLNndpV0VDcVRHNUdETzZX?=
 =?utf-8?B?eXpDWXR3RjZlTmdUOEhpVjhzcVY5bEJnNE1qVERjUzNsMkxGTVdnVk1hM05R?=
 =?utf-8?B?U0RFejRiUnZwQ3cxUnpXaHRCaktHK2MrTHRNYng4VS9oeFFab0cyU3RFNmhE?=
 =?utf-8?B?NFN6VFhTaHoyQmJTd21uYXBmYUFQTWVUdWJ6MEdlQVdIY1hVRXI0UjIvdng4?=
 =?utf-8?B?VU5hWGtwWFhMajVORzJ3cm0zNGNqcnJPeUEvZ00wMEgrY3NtWnVUYStKSUNH?=
 =?utf-8?B?UzYybEIwYjR0L0VmSGFJLzFhMUU5cHRYbW8xZmk1T1hocWRqODV2WFFFdXhz?=
 =?utf-8?B?NFdLb3MzTjBhbWRKQ0U4aUw4cVV3LzdyRnQ3aVU5TjZBS2lqSXBRS0l5VWwr?=
 =?utf-8?B?YlVEQzNwb1VOYXZ3ZWlpdGl2SkErS0dUY1ZMTFIzd1lPTlc3dG1RaVRYU0tj?=
 =?utf-8?B?M3FlcFN6YjZUVlprVEJ6TTZ4d2h5VHJ3QzJML3pRaHBPMXppWVdFLzRFQjhq?=
 =?utf-8?B?RnV5NENnM1M1RUNKdTVRL05zY0llQndWRjlrM3pXMFBpajBzV1Y2REtvUW13?=
 =?utf-8?B?dllnMHBCTmpoNUVIejNzUjRvMExINUhmU1BML25jejJjRVVXZXovbXJya08r?=
 =?utf-8?B?ckx6OG5Sa2pJQTRCWElZcjFzeUdmUWZNamVKOWVleDBqY3lGMmkxcXh1allU?=
 =?utf-8?B?MDIwRGJkd2x0aFkyQnZrVGpMMDZ6M3pYbmhaY2Z4RUdkZXF5QnVpb0l4REoz?=
 =?utf-8?B?RXJyUUY1UTRWQjI1SlFmU21tSnlJTUc0eEhVLzBQcnY4V3U1Vk9RUHRYcnpM?=
 =?utf-8?B?NmlsSnRhMTNDQUF4UGVDaWR4QkIwSXREZHk4REcrWnQzNXg4YmdsSSs0QVk4?=
 =?utf-8?B?VUlIeUtlUjRCYlNlSEMrbzRRNmw3L1pNcCtlbnhOTzdGUEFSQ1puR1FpandE?=
 =?utf-8?B?Wkw4L0pDTTZBTEtraHNMRHBGMlNRb2F6YSs2R1lTdFFJTGJHT05lZnI1aC9k?=
 =?utf-8?B?aW5vRSsxSW9SbkRVejhjTCszclY5NTF5K1RCZW9lMUEyajBPMXN5UlhDTjRL?=
 =?utf-8?B?L0F2UmN3YnMyNW16djA4SlE5TzY4d29MUUVEWGFvY093amFEYWRMVVl4aFdp?=
 =?utf-8?B?WjV4ZGFlM2QzZmh5ZTFhTXlEazZqYUIvRFpWZUJjMGRSNnZaUjJKWWtpMHFW?=
 =?utf-8?B?RW9qV1dUOFQrQzFPWno4TTR4Y2JTT3U0WlgzQzI0eTMvRnA3QTFCaVJBbE1C?=
 =?utf-8?B?dEM0dXZ1RGZ0c1lzZm9ta0hXdVpJZGpodUZneVZLdXllSEpRQWc1SkZJaUUx?=
 =?utf-8?B?SUQxWTFwY2RJVVBIVUJmeGhVY1l6QXlsY2NOWmpKOGIvV05LdzM5U0JWRnlj?=
 =?utf-8?Q?qnmgll4Lf2RS2WWVAtvAMV2X21Ff5Ef0pqh9ukHvkEAEB?=
x-ms-exchange-antispam-messagedata-1: 7i1VpJ/k62ZjS2zbTqQyrgDtNp7i5DDzJN8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90437bca-a1de-4124-c005-08da1e0b7283
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 11:39:34.0744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIwQ1sfhzOgEE5nzEU51x1dGkSoxSVUiNbaecZ3CtGBQU63MbC50cs1kfkG1LqJWMjeUJ6XcpBrjQ8v9Rlo6vkY5Ew4xEhtYO2gra2Yomk6Y4wSpBxogc90MuvwXY4Zp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3540
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWxpbSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KPiBGcm9tOiBBbGltIEFr
aHRhciwgU2VudDogVGh1cnNkYXksIEFwcmlsIDE0LCAyMDIyIDE6MzkgUE0NCj4gDQo+IEhpIFlv
c2hpaGlybw0KPiANCj4gPkZyb206IFlvc2hpaGlybyBTaGltb2RhIFttYWlsdG86eW9zaGloaXJv
LnNoaW1vZGEudWhAcmVuZXNhcy5jb21dDQo+ID5TZW50OiBUaHVyc2RheSwgQXByaWwgMTQsIDIw
MjIgODowMSBBTQ0KPiA+DQo+ID5BZGQgVUZTSENEX1FVSVJLX0JST0tFTl82NEJJVF9BRERSRVNT
IGZvciBhIGJyb2tlbiBob3N0IGNvbnRyb2xsZXIgb2YNCj4gPnRoZSA2NC1iaXQgYWRkcmVzc2lu
ZyBzdXBwb3J0ZWQgY2FwYWJpbGl0eS4NCj4gPg0KPiBBIGxpdHRsZSBtb3JlIGRldGFpbHMgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlIHdpbGwgaGVscCB0byB1bmRlcnN0YW5kIHRoZQ0KPiBjaGFuZ2Vz
IG1vcmUuDQo+IERvZXMgaXQgbWVhbiB0aGlzIEhDSSBoYXMgb3RoZXIgYWRkcmVzc2luZyBtb2Rl
IChvdGhlciB0aGFuIDMyIGFuZCA2NCk/DQo+IExpa2UgYSAzNmJpdCBhZGRyZXNzPyBJbiB0aGF0
IGNhc2UsIGRvZXMgSG9zdCBjb250cm9sbGVyIGlzIGJlaGluZCBhbnkNCj4gSU9NTVU/DQoNCk5v
LCB0aGlzIEhDSSBvbmx5IGhhcyBhIDMyYml0IGFkZHJlc3MsIGJ1dCB0aGUgTUFTS182NF9BRERS
RVNTSU5HX1NVUFBPUlQgaXMgc2V0Li4uDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGlt
b2RhDQoNCj4gDQo+ID5TaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJv
LnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4tLS0NCj4gPiBkcml2ZXJzL3Njc2kvdWZzL3Vm
c2hjZC5jIHwgMyArKy0NCj4gPiBkcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5oIHwgNiArKysrKysN
Cj4gPiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
DQo+ID5kaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYyBiL2RyaXZlcnMvc2Nz
aS91ZnMvdWZzaGNkLmMgaW5kZXgNCj4gPjNmOWNhYWZhOTFiZi4uYTdiYjM5NDVjN2M2IDEwMDY0
NA0KPiA+LS0tIGEvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYw0KPiA+KysrIGIvZHJpdmVycy9z
Y3NpL3Vmcy91ZnNoY2QuYw0KPiA+QEAgLTk1MTMsNyArOTUxMyw4IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKHVmc2hjZF9kZWFsbG9jX2hvc3QpOw0KPiA+ICAqLw0KPiA+IHN0YXRpYyBpbnQgdWZzaGNk
X3NldF9kbWFfbWFzayhzdHJ1Y3QgdWZzX2hiYSAqaGJhKSAgew0KPiA+LQlpZiAoaGJhLT5jYXBh
YmlsaXRpZXMgJiBNQVNLXzY0X0FERFJFU1NJTkdfU1VQUE9SVCkgew0KPiA+KwlpZiAoIShoYmEt
PnF1aXJrcyAmIFVGU0hDRF9RVUlSS19CUk9LRU5fNjRCSVRfQUREUkVTUykgJiYNCj4gPisJICAg
IGhiYS0+Y2FwYWJpbGl0aWVzICYgTUFTS182NF9BRERSRVNTSU5HX1NVUFBPUlQpIHsNCj4gPiAJ
CWlmICghZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChoYmEtPmRldiwNCj4gPkRNQV9CSVRfTUFT
Syg2NCkpKQ0KPiA+IAkJCXJldHVybiAwOw0KPiA+IAl9DQo+ID5kaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zY3NpL3Vmcy91ZnNoY2QuaCBiL2RyaXZlcnMvc2NzaS91ZnMvdWZzaGNkLmggaW5kZXgNCj4g
Pjk0ZjU0NWJlMTgzYS4uMTc0NTE0NGViOTA0IDEwMDY0NA0KPiA+LS0tIGEvZHJpdmVycy9zY3Np
L3Vmcy91ZnNoY2QuaA0KPiA+KysrIGIvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuaA0KPiA+QEAg
LTYwMiw2ICs2MDIsMTIgQEAgZW51bSB1ZnNoY2RfcXVpcmtzIHsNCj4gPiAJICogc3VwcG9ydCBw
aHlzaWNhbCBob3N0IGNvbmZpZ3VyYXRpb24uDQo+ID4gCSAqLw0KPiA+IAlVRlNIQ0RfUVVJUktf
U0tJUF9QSF9DT05GSUdVUkFUSU9OCQk9IDEgPDwgMTYsDQo+ID4rDQo+ID4rCS8qDQo+ID4rCSAq
IFRoaXMgcXVpcmsgbmVlZHMgdG8gYmUgZW5hYmxlZCBpZiB0aGUgaG9zdCBjb250cm9sbGVyIGhh
cw0KPiA+KwkgKiA2NC1iaXQgYWRkcmVzc2luZyBzdXBwb3J0ZWQgY2FwYWJpbGl0eSBidXQgaXQg
ZG9lc24ndCB3b3JrLg0KPiA+KwkgKi8NCj4gPisJVUZTSENEX1FVSVJLX0JST0tFTl82NEJJVF9B
RERSRVNTCQk9IDEgPDwgMTcsDQo+ID4gfTsNCj4gPg0KPiA+IGVudW0gdWZzaGNkX2NhcHMgew0K
PiA+LS0NCj4gPjIuMjUuMQ0KPiANCg0K
