Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B63556630B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 08:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiGEGXz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 02:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiGEGXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 02:23:51 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329F7FD19;
        Mon,  4 Jul 2022 23:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfZZ57qiYKC154rfqMHVRTfdAY8mu3SXI7eVuzs5zAYpGC5JNocVTRqUBeGyTVzE6948Z7aAAkIh73eF0DrElvFZAe7k/9lHj87S5DxpWHVj4g1+8/3CTPDOntM/YobFzauKEyehtUPWnlwDr2RNrF3VZOolMpH69umCKeRoHY1hVvw4KXaQBhso34jPVETUw1JsbgOIXUl3WE4rGGwbZAIQ3LFnStop90kkur9T3vCthGJcYr+h5R/VxrHgRHneG9KJ7EPvuIo4XSiMarFSPdbu6o/wpk1RtUrcbT2zfC7ntyz7UdGn5Db0ZrLhxJOmuwpdTcoC6LSsCmnUxtjOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EGNp5OpvrrrMyZXBtaHSzdCyGcW1jsxFdft+Y1r844=;
 b=aZ4jZ4VYrxI5DrH44F7zaEKTQ1cGdZCRIRWLOGLkm5spQYc6sMTYEqBzMFk9t6MjRa6OJ+ciuDrZwaLCHpfW2jY8iHFlxO6k4IK5qLzFGeEgELymYjLI2BXUPuGeYvFB28si3l4WGRvP2ymk+E/6r83sGW+Fz5fE1rUeKqWUmmOnWGU29vG+xmnNKBLeFqFD4CwDhEzM5hixlPqD1jFn98JmlI+nrKabjT4cKBSCx7EtC0NZ0Cu3FcphnxUrlpBUzsBDYYMMWNQ4BtdsffPrH4UDyeTNBiKRwBhG5hmG6O9CX5SgTa1BlZx0Bwm9xURoGZUjjNYpk+KX++E402vLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EGNp5OpvrrrMyZXBtaHSzdCyGcW1jsxFdft+Y1r844=;
 b=fLUcfe8TWWV9y4b54BY6COV9SQ3BQ5BoOd5VgB0gFdk1bIeGoIaJFnaknH9OvPGt4Bv0r+ae6yw/XvmlfavS8/vg9tE2Stg0jJYVbZK1dqEjOZwxJAwUgVz4ce2PEshwqUVQcrtxFHnqX4IbXS25DWQsKSKVxaTPHPo9bDgJFcw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3817.jpnprd01.prod.outlook.com (2603:1096:404:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 06:23:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%9]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 06:23:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Johan Hovold <johan@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Topic: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Index: AQHYjFzicLJAOXueakmTUlp0Tbrj9q1tx+UAgAAIuvCAAYRegA==
Date:   Tue, 5 Jul 2022 06:23:45 +0000
Message-ID: <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
 <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dee22a76-6fde-4c58-67af-08da5e4eea00
x-ms-traffictypediagnostic: TY2PR01MB3817:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ZeSXHPDwG9ScEOAfSLSYtA/6gaIRWbqSip2d7AQxi9vvainWwRhDe7dRGcHdmriSDZSu/ieCSwT4mNO+8Dpin5wS54q9ifxs/peDSwKJ1Ty+eMcO6zoEk32aDq1mbQ2lgkxDkKaoZVjCAnZQZ9gjAkkqtVQEuwvkQQXUMplMoIb/JxH+Wq6GpQYl6E/1nNdUbJqTGHCDagkw/z4NHss8EJTf2v6RLEOZRxm6Kxop1/h6o8Qpr8KCZlSa7e6WzxMM5HM0scFNvDf8rXTWrvdA2N8V8GYzwIogf1tvsZ/7BCYTDJXwxCW3XA1DT9AhrCx67ncfKQqSAY1r+9zKYjcN3GMiQeICeAKsmtLmd/ICCS/FP+vRBRNHjxoapEA162JKgVhzcDWFTKlFkJNuLNUHQB+WdaewQtgWPcTA5pznKy0LPKfa+O3axolOa2e8q1gJgGGpD10K8vV2mRuygtkfjAO172CtpjUbQ5BCxg64798Jp5j1vKP1z6l0N4Tn6tBCf7eaPlPWqVBqClUkRqp4p6OiuyeKJ6AHkRg7OHZFVwg6AU2c2Yqs7CcicUsgs/P/K5LTPN0goH2/GPVfuZmEUszsp90JR5VHllviv7UMUn5eIHe725UWXQtczFDCvz4GNmEg8jBhAOqHFPAUCbpWneXBixOgWXqdu/3nB+pRbwIP4TjbVqqRrH3MWm76CGtvUZJVwMEf1BFterTVt+KB54UE3VaXnQAQV4sqCGGccEhQGpg1IRdNRV03KNZGkjESir/CvJxyBroYYqLF0ixgA7540iqAhML+Efqhye7jNTWeyj4jonJ0UY9uopmyk0T1XUCeDJJwPQb7SSdeU9Inud5sAUTP3c5+kbNTXxyAZ8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(186003)(66556008)(83380400001)(55016003)(38100700002)(41300700001)(122000001)(26005)(6506007)(110136005)(66446008)(53546011)(316002)(478600001)(33656002)(54906003)(7696005)(71200400001)(38070700005)(966005)(66476007)(4326008)(8936002)(76116006)(8676002)(52536014)(86362001)(66946007)(2906002)(64756008)(5660300002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z255RnhIVGVuZ1NmODF1ZHBhR3BDZXB3b2xRaVZ4YmEvRUM1VFNleXpzS0tK?=
 =?utf-8?B?dEVJZ3NoTGU3NEd5OVVNSW9aVTBoa0NOUm5mRkY2MTdQYkdUUExyTnZrNVBy?=
 =?utf-8?B?NHBjMXNjL1VPRFRGWEhOc0V4Vlg2ZSt6cXdsb21qbGk3aTlPc252UVA3M1VT?=
 =?utf-8?B?ZEJMMmE3M1dBVFZGQVVMOGdLb3ZaQ0kycDN3WmJZZG1FcWtkNGpabGI1dDBK?=
 =?utf-8?B?a2t6M1VXNktLa254MXUxUlNnRFF1MTVkdlR4SXNlRGkyb1YrTzFOcjIrbkN4?=
 =?utf-8?B?WUw1Y1J0SU5IdS9SMXRvS1VEOEJ0NDRJb04zejh4NDlnOEV6NjA0U1Ivcksw?=
 =?utf-8?B?Rjk4U2NrcUZQcjQ0K085T3grSzVGZ3V6WTFzV1FndGpxYTQ1MjZPNXdjMFgx?=
 =?utf-8?B?Sldwd2tGVVcyZFhZbjRrZGovRDU4bkppK0RSdWRMRS9PbWZCNFhhRy9neXpX?=
 =?utf-8?B?SmRKaWFkNHZ6dlcwOHJrOFk3WE9uNkRFU3VpaENvQ25xL0s3ckQzd2JKRDlN?=
 =?utf-8?B?SGMxYm5NbWFBSkFwMEdzanlhTnFucXNNeFpObjI3SEhOSU8zN0tqWmphMDhZ?=
 =?utf-8?B?UUJqV01penZEeXFXWkxySEJndkhOK0lmb1E1WE1uZ1QwZGNnakxRMEFBaU5Y?=
 =?utf-8?B?WHFBaDlYQnY0OXpYWlFJWmVMQnJNQlpiU2hGL3E1OVBIM0wrMHZFQ3owVWFh?=
 =?utf-8?B?UE5EL3hmbHJRcTQxMnV2a1NCdVJYaUFKbExJVW5sMGs4bVBCamxwc3RYQys4?=
 =?utf-8?B?cVd4M0hSUlV4NVFZUmgrcGhTWjJrYmk4dVp2UmNwS0ZPN1hHVGttSWlFTmIr?=
 =?utf-8?B?a2NEYTlkT0wvSVJGRGJCUm1kYmJGQ2dtcTZMZGRIUkNWWi9tYjBJNDdCUHR4?=
 =?utf-8?B?NW0xYWdvbW43RUo4ck43THNtMEZjWnRyMC9RYllqS3drY0JvS2U1VjRTTXBl?=
 =?utf-8?B?c3lMWGR5RVRvbnRNdHdOWUd6V0cyNTlyaTcySUViUnphZDRUeEc0bGtQV253?=
 =?utf-8?B?dThpbDZOZzBadlU1RjZoMDNKQTJTNnpZQWtuRFdoaFJQSlh5Tm43ZVdnaWRu?=
 =?utf-8?B?enRZOWdERXhTQXVUcDQ4Nmo1ZTFUd3BTb0FJKy9ON2czRVFqM3Rza0hoSU5y?=
 =?utf-8?B?UmV3WjFIRTc1K3hqdVFVSmYzS3p5MW5OMWNZc293VEM4QlRVWjhKMHNDZXFq?=
 =?utf-8?B?V2FPYWpzaHhuaEpqMnVFdmdoSEtKdkg3N0t6S0RsQTVnWUZnSFpyVnM3RzNo?=
 =?utf-8?B?M1ZQRHNNVVpBSGMrYVdrL0pNM0xYVGNvenFPbEpVM2RCMjEybU1vTlVRczNu?=
 =?utf-8?B?ekFqUVJIK1hiam5CYVV3YzhJSWNtay9GWE0wOWtCcEE5ZS84amoyT3JKMmlw?=
 =?utf-8?B?THU0TlI4ZE01OUdmM1JocXRXeXNmUzdjeHFuUTJuc01tOTE3MlVFV252dkZY?=
 =?utf-8?B?M1FFNW03WDVZbWJGSWdqUjhvanM3Uk0xeHluS0tqVlJLaEdVZWVFN2IvdVZB?=
 =?utf-8?B?ajZFNThvamhYRmJWZFhvK29vNTBsQWRaNHNsQ2l6SzIzVFRnTFVISjJNWnJF?=
 =?utf-8?B?UHR6RDllZld0VFQxVGJwOFVKaUhoalBZbTlzWWNqZWxienN3b3dGVUtiYUUz?=
 =?utf-8?B?eGR5anorWGd5b3c5ZDEwVHdKdkdUYzlKT3IreERMVWowTTN1bGY2RHJBdTlm?=
 =?utf-8?B?MzIwYTNHLzB2OUU3OElLaTlDMkp5VWlIcW9CZVB1QWM4cXJXclVsYm1SRXNs?=
 =?utf-8?B?WFUwSG8rQjBhQStEZWI5S1p1aHNaV0FpTDRUWmpwNk9RUXdhNlRtUWJMc1ZB?=
 =?utf-8?B?M0hjc2VCL2NjSnkxUjhsY0dVWlZhREgwenRKN2hpL0RZM2E2c21ucGZUc1BR?=
 =?utf-8?B?MUlEeWcrcEh0ZEVTZnFKLy9xUjlyT3R5L2RlZCtyM0VFU3llM2VNaEJHaVdX?=
 =?utf-8?B?WmNxQjRYNmZMRHJVdHVtWS8xMmkrSExpSU16TGlvNGxjNlc2M0tFS0hqZDJh?=
 =?utf-8?B?UW16L1FLMDV1V0ZhNUVNM2k4cVBGMjJUbm5Zd3ZVR0lyMjlZVXRuaytySmNO?=
 =?utf-8?B?TXRmMmNWZEZQNVFSN3ljM1haa1NKaXdIR28vcE95Y2FnbndXRTZtUnUrcEtE?=
 =?utf-8?B?eFFSS1BhTDJHVXdsamFGclBVa3U5aDRrZ2tudFh2cVkrM3BuUm5LWFV2WEJu?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee22a76-6fde-4c58-67af-08da5e4eea00
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 06:23:45.2076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ryMKmV0BBL6ptpjhfIOE+PCddK7zJsKoKUj331/2HXU0rKKvUI48QVRDP4xZ6MLRnZLK01Uh6u/41SRTlcKGe/OJ62fHan2X0p+r9JMKiCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3817
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSmlyaSBhbmQgTWlxdWVsLA0KDQpXaGlsZSB0ZXN0aW5nIHNlcmlhbCBkcml2ZXIgd2l0aCBS
Wi9OMSBvbiA1LjE1IGtlcm5lbCwgd2hpY2ggaXMgdGhlIGJhY2twb3J0IG9mIG1haW5saW5lIGtl
cm5lbCwNCkkgc2VlbiBwZXJmb3JtYW5jZSBpc3N1ZSB3aXRoIHNlcmlhbCBETUEgZm9yIGhpZ2hl
ciBiYXVkIHJhdGVzLg0KDQpUaGUgdGVzdCBhcHAgaXMgdGFraW5nIDI1IG1pbnV0ZXMgZmluaXNo
LCB3aGVyZWFzIHdpdGggdGhlIGJlbG93IHBhdGNoWzFdIGl0IHRha2VzIG9ubHkgMyBtaW51dGVz
IHRvIGZpbmlzaC4NCg0KTm90IHN1cmUgaGFzIGFueW9uZSBzZWVuIHRoaXMgcGVyZm9ybWFuY2Ug
aXNzdWU/DQoNClsxXQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBf
cG9ydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0LmMNCmluZGV4IDQ2OGQx
YWNhNTk2OC4uMzIxNDMwMTc2Njk4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsLzgy
NTAvODI1MF9wb3J0LmMNCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfcG9ydC5j
DQpAQCAtMjY4MCw3ICsyNjgwLDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBzZXJpYWw4MjUwX2dl
dF9iYXVkX3JhdGUoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwNCiAgICAgICAgICAgICAgICBtYXgg
PSAocG9ydC0+dWFydGNsayArIHRvbGVyYW5jZSkgLyA0Ow0KICAgICAgICB9IGVsc2Ugew0KICAg
ICAgICAgICAgICAgIG1pbiA9IHBvcnQtPnVhcnRjbGsgLyAxNiAvIFVBUlRfRElWX01BWDsNCi0g
ICAgICAgICAgICAgICBtYXggPSAocG9ydC0+dWFydGNsayArIHRvbGVyYW5jZSkgLyAxNjsNCisg
ICAgICAgICAgICAgICBtYXggPSBwb3J0LT51YXJ0Y2xrOw0KICAgICAgICB9DQoNCk5vdGU6LQ0K
SSBoYXZlIGFkZGVkIGJlbG93IGNoYW5nZSBvbiA1LjE1IGtlcm5lbCB0byB0ZXN0IG9uIGFsbCBw
b3NzaWJsZSB1c2UgY2FzZXMuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2R3LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMNCmluZGV4IDc4
ODRmY2Q2NmQzOS4uNmQzNTI5ODFmYjNlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy90dHkvc2VyaWFs
LzgyNTAvODI1MF9kdy5jDQorKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMN
CkBAIC02NDMsNiArNjQzLDI2IEBAIHN0YXRpYyBpbnQgZHc4MjUwX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQogICAgICAgICAgICAgICAgdXAtPmRtYSA9ICZkYXRhLT5kYXRh
LmRtYTsNCiAgICAgICAgfQ0KIA0KKyAgICAgICBpZiAoZGF0YS0+cGRhdGEtPnF1aXJrcyAmIERX
X1VBUlRfUVVJUktfSVNfRE1BX0ZDKSB7DQorICAgICAgICAgICAgICAgLyoNCisgICAgICAgICAg
ICAgICAgKiBXaGVuIHRoZSAnY2hhciB0aW1lb3V0JyBpcnEgZmlyZXMgYmVjYXVzZSBubyBtb3Jl
IGRhdGEgaGFzDQorICAgICAgICAgICAgICAgICogYmVlbiByZWNlaXZlZCBpbiBzb21lIHRpbWUs
IHRoZSA4MjUwIGRyaXZlciBzdG9wcyB0aGUgRE1BLg0KKyAgICAgICAgICAgICAgICAqIEhvd2V2
ZXIsIGlmIHRoZSBETUFDIGhhcyBiZWVuIHNldHVwIHRvIHdyaXRlIG1vcmUgZGF0YSB0byBtZW0N
CisgICAgICAgICAgICAgICAgKiB0aGFuIGlzIHJlYWQgZnJvbSB0aGUgVUFSVCBGSUZPLCB0aGUg
ZGF0YSB3aWxsICpub3QqIGJlDQorICAgICAgICAgICAgICAgICogd3JpdHRlbiB0byBtZW1vcnku
DQorICAgICAgICAgICAgICAgICogVGhlcmVmb3JlLCB3ZSBsaW1pdCB0aGUgd2lkdGggb2Ygd3Jp
dGVzIHRvIG1lbSBzbyB0aGF0IGl0IGlzDQorICAgICAgICAgICAgICAgICogdGhlIHNhbWUgYW1v
dW50IG9mIGRhdGEgYXMgcmVhZCBmcm9tIHRoZSBGSUZPLiBZb3UgY2FuIHVzZQ0KKyAgICAgICAg
ICAgICAgICAqIGFueXRoaW5nIGxlc3MgdGhhbiBvciBlcXVhbCwgYnV0IHNhbWUgc2l6ZSBpcyBv
cHRpbWFsDQorICAgICAgICAgICAgICAgICovDQorICAgICAgICAgICAgICAgZGF0YS0+ZGF0YS5k
bWEucnhjb25mLmRzdF9hZGRyX3dpZHRoID0gcC0+Zmlmb3NpemUgLyA0Ow0KKw0KKyAgICAgICAg
ICAgICAgIC8qDQorICAgICAgICAgICAgICAgICogVW5sZXNzIHlvdSBzZXQgdGhlIG1heGJ1cnN0
IHRvIDEsIGlmIHlvdSBzZW5kIG9ubHkgMSBjaGFyLCBpdA0KKyAgICAgICAgICAgICAgICAqIGRv
ZXNuJ3QgZ2V0IHRyYW5zbWl0dGVkDQorICAgICAgICAgICAgICAgICovDQorICAgICAgICAgICAg
ICAgZGF0YS0+ZGF0YS5kbWEudHhjb25mLmRzdF9tYXhidXJzdCA9IDE7DQorICAgICAgIH0NCisN
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEJpanUgRGFzDQo+IFNlbnQ6IDA0IEp1bHkgMjAyMiAwODoxMg0KPiBUbzogSmlyaSBTbGFieSA8
amlyaXNsYWJ5QGtlcm5lbC5vcmc+OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPg0KPiBDYzogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb20+OyBNaXF1ZWwgUmF5bmFsDQo+IDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPjsgRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz47IFBoaWwNCj4g
RWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5jb20+OyBKb2hhbiBIb3ZvbGQgPGpvaGFu
QGtlcm5lbC5vcmc+Ow0KPiBsaW51eC1zZXJpYWxAdmdlci5rZXJuZWwub3JnOyBHZWVydCBVeXR0
ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgQ2hyaXMgUGF0ZXJzb24gPENo
cmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT47DQo+IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5l
c2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
RTogW1BBVENIXSBzZXJpYWw6IDgyNTA6IGR3OiBGaXggdGhlIG1hY3JvDQo+IFJaTjFfVUFSVF94
RE1BQ1JfOF9XT1JEX0JVUlNUDQo+IA0KPiBIaSBKaXJpLA0KPiANCj4gVGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2suDQo+IA0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHNlcmlhbDogODI1MDogZHc6
IEZpeCB0aGUgbWFjcm8NCj4gPiBSWk4xX1VBUlRfeERNQUNSXzhfV09SRF9CVVJTVA0KPiA+DQo+
ID4gT24gMzAuIDA2LiAyMiwgMTA6MzksIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gQXMgcGVyIFJa
L04xIHBlcmlwaGVyYWwgdXNlcg0KPiA+ID4gbWFudWFsKHIwMXVoMDc1MmVqMDEwMC1yem4xLXBl
cmlwaGVyYWwucGRmKQ0KPiA+ID4gcmV2IDEuMC4wIE1hciwyMDE5LA0KPiA+DQo+ID4gSXMgdGhp
cyBwdWJsaWMgYW55d2hlcmU/DQo+IA0KPiBZZXMsIEl0IGlzIGF2YWlsYWJsZSBoZXJlWzFdIHNl
ZSBwYWdlIDcyIGFuZCA3My4NCj4gDQo+IFsxXSBodHRwczovL3d3dy5yZW5lc2FzLmNvbS91cy9l
bi9kb2N1bWVudC9tYWgvcnpuMWQtZ3JvdXAtcnpuMXMtZ3JvdXAtDQo+IHJ6bjFsLWdyb3VwLXVz
ZXJzLW1hbnVhbC1wZXJpcGhlcmFscz9sYW5ndWFnZT1lbiZyPTEwNTQ1NjENCj4gDQo+IA0KPiA+
DQo+ID4gPiB0aGUgdmFsdWUgZm9yIDhfV09SRF9CVVJTVCBpcyA0KGIyLGIxPTLigJliMTApLg0K
PiA+ID4NCj4gPiA+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIG1hY3JvIGFzIHBlciB0aGUgdXNlciBt
YW51YWwuDQo+ID4NCj4gPiBJJ20gY3VyaW91cywgaXMgdGhlIGJvdHRvbSBiaXQgZnJvbSAiMyIg
aWdub3JlZCBieSB0aGUgSFcgb3IgZG9lcyB0aGlzDQo+ID4gZml4IGEgcmVhbCBwcm9ibGVtIGlu
IGJlaGF2aW9yPyBTdGF0aW5nIHRoYXQgbWlnaHQgaGVscCBiYWNrcG9ydGVycyB0bw0KPiA+IGRl
Y2lkZSBpZiB0byB0YWtlIHRoZSBwYXRjaCBvciBub3QuDQo+IA0KPiBTZWUgcGFnZSA3MiBhbmQg
NzMuDQo+IA0KPiBZZXMsIGl0IGZpeGVzIGEgcmVhbCBwcm9ibGVtIGFzIGJ5IHVzaW5nIGEgdmFs
dWUgb2YgOCAsIHlvdSBhcmUgd3JvbmdseQ0KPiBjb25maWd1cmluZyBETUFfQlVSU1RfU0laRSBv
ZiAxIGluc3RlYWQgb2YgRE1BX0JVUlNUX1NJWkUgb2YgOC4NCj4gDQo+IGIyLCBiMSBiVWFydF9E
RVNUX0JVUlNUDQo+IF9TSVpFDQo+IERFU1RfQlVSU1RfU0laRQ0KPiBEZXN0aW5hdGlvbiBCdXJz
dCBUcmFuc2FjdGlvbiBTaXplIGluIFRyYW5zbWl0IEZJRk8uDQo+IFVBUlQgaXMgdGhlIGZsb3cg
Y29udHJvbGxlci4gVGh1cywgdGhlIHVzZXIgbXVzdCB3cml0ZSB0aGlzIGZpZWxkIGJlZm9yZQ0K
PiBvciBhdCB0aGUgc2FtZSB0aW1lIHRoZSBETUEgbW9kZSBpcyBlbmFibGVkLiBOdW1iZXIgb2Yg
ZGF0YSBieXRlLCB0byBiZQ0KPiB3cml0dGVuIHRvIHRoZSBUcmFuc21pdCBGSUZPIGV2ZXJ5IHRp
bWUgYSB0cmFuc21pdCBidXJzdCB0cmFuc2FjdGlvbg0KPiByZXF1ZXN0IGFyZSBtYWRlIG9uIERN
QSByZXF1ZXN0Lg0KPiAy4oCZYjAwID0gMSBieXRlDQo+IDLigJliMDEgPSA0IGJ5dGVzDQo+IDLi
gJliMTAgPSA4IGJ5dGVzDQo+IDLigJliMTEgPSBSZXNlcnZlZCwgbm90IHVzZWQNCj4gDQo+IENo
ZWVycywNCj4gQmlqdQ0KPiANCj4gDQo+ID4NCj4gPiA+IEZpeGVzOiBhYTYzZDc4NmNlYTIgKCJz
ZXJpYWw6IDgyNTA6IGR3OiBBZGQgc3VwcG9ydCBmb3IgRE1BIGZsb3cNCj4gPiA+IGNvbnRyb2xs
aW5nIGRldmljZXMiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84
MjUwLzgyNTBfZHcuYyB8IDIgKy0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5
L3NlcmlhbC84MjUwLzgyNTBfZHcuYw0KPiA+ID4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84
MjUwX2R3LmMNCj4gPiA+IGluZGV4IGY1N2JiZDMyZWYxMS4uOTMxNDkwYjI3ZDZiIDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMNCj4gPiA+IEBAIC00Nyw3ICs0Nyw3
IEBADQo+ID4gPiAgICNkZWZpbmUgUlpOMV9VQVJUX3hETUFDUl9ETUFfRU4JCUJJVCgwKQ0KPiA+
ID4gICAjZGVmaW5lIFJaTjFfVUFSVF94RE1BQ1JfMV9XT1JEX0JVUlNUCSgwIDw8IDEpDQo+ID4g
PiAgICNkZWZpbmUgUlpOMV9VQVJUX3hETUFDUl80X1dPUkRfQlVSU1QJKDEgPDwgMSkNCj4gPiA+
IC0jZGVmaW5lIFJaTjFfVUFSVF94RE1BQ1JfOF9XT1JEX0JVUlNUCSgzIDw8IDEpDQo+ID4gPiAr
I2RlZmluZSBSWk4xX1VBUlRfeERNQUNSXzhfV09SRF9CVVJTVAkoMiA8PCAxKQ0KPiA+ID4gICAj
ZGVmaW5lIFJaTjFfVUFSVF94RE1BQ1JfQkxLX1NaKHgpCSgoeCkgPDwgMykNCj4gPiA+DQo+ID4g
PiAgIC8qIFF1aXJrcyAqLw0KPiA+DQo+ID4gdGhhbmtzLA0KPiA+IC0tDQo+ID4ganMNCg==
