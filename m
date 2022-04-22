Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662E450B629
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 13:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447024AbiDVLcq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 07:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242447AbiDVLcp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 07:32:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7775522E;
        Fri, 22 Apr 2022 04:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or289IEtk2CBKUuKFTv3KF/KB5m4e1m12uzOQRlkIGzSWDeg2RJqjUAEub7rENJyhOD1F4ALYQAB3Etlqqx2Xrr6dy1LXjLpjFdHnp8wXWjmBD8llyqIMxox0a/ip1oRAVRs5PwyCV9uKvt94SHMJA9ZF/ktZW8v4f6QDZd5ANMIUnoZ+YeBfbBic40cOckmY2ANgHbdsfZuLngE0qaSLXQb9UCjbITB0vf3ssnHJKY+uPyB/jd/sIy+L211RwqSATS4GshqQUSFdb39Q0Dt5uzlBcr1+s3LdExgszaHIOZ9/r6Aa9AZEroYdWFpRb4i12bUyad8suOPmaYk++2YVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/QHZXCQWkNHXP9RptCPI29zMFnOG210CZP+WedL+dE=;
 b=haNQOOoBRf47ApCsx1ldXtR6uw5FUb7gi+9ELzfGNw2ikqxqQFgIql82LM1ERp2A61oW+gVoPEtm+dbu7pV7zXsUc2sibOgy+1OW03pInHql9sEbPtXryE0h8sFzx4QBECud/kVJz/QGpuIRkYXX1aPgpCm01tLWqZhfTWjynEOG/bJwm+EC0lsod55tB7d9Ypp2PFYXHgV4ialiDsmoah+l2c0KZgq/tPOE8eKfgbPcvsiGGn9saA9vq4sGEtgXIFpFmigfamOU4ivhfseD1zSE+aAYfHAWEcXj6oTbRz6X0ixxRI7G24raSxxPvl1HQisFJfmi04gejK1a3c+lOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/QHZXCQWkNHXP9RptCPI29zMFnOG210CZP+WedL+dE=;
 b=HiJT9QRZXuLfrYZLSa7QAKoVTmLkbiDg6Ty1kdKiviuwUPOs9EiRZK06QFzyIkIj07izSFP0969SKkSE0L4vQsSyreO0M5L/yHx6JLFTPOHqOvf46bxxkADZc2pDBSQD7ij0JnGcGJZoFJ4FyhmXOP3YgELbJGpNcflBIu2PtV8=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS3PR01MB8586.jpnprd01.prod.outlook.com (2603:1096:604:19d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 11:29:49 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:29:49 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Thread-Topic: [PATCH v2 03/13] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Thread-Index: AQHYREyWXDjuboZuFkypK7RfgpWo2qz5biaAgAJon+A=
Date:   Fri, 22 Apr 2022 11:29:49 +0000
Message-ID: <TYYPR01MB70867EDF52038CBA6FD42383F5F79@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-4-phil.edworthy@renesas.com>
 <CAMuHMdXy7XPcAmBLuCeXwZcPxNrfBs2yBN+tLicjHLQxQO=B2Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXy7XPcAmBLuCeXwZcPxNrfBs2yBN+tLicjHLQxQO=B2Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ba0656e-4532-43e4-df70-08da24536927
x-ms-traffictypediagnostic: OS3PR01MB8586:EE_
x-microsoft-antispam-prvs: <OS3PR01MB8586AB51F6A871A6A2140432F5F79@OS3PR01MB8586.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lG6Kuq7GLiejFxb8swgwwdR1TR9dKOzpK4gNc8qYeOKZkW5BQFT6w/hsLj7XBWAsggsZHxR3TCvMc3MsiHocYy8WdP9Q79hGcXyasxNB4frJAfMU9E5+cAIvVYjYHc8ZyFSu6fqdD0keuiq7anJA+t0P9lQ7PE6+kRUIugglrUBBha00+t1csk2RL5QRw3Ua5GIs5bCmnnZwJ6eN36ojx8Ko6FlINN04fEC2ByZxOFhPLAXsPqDWuve7t6u2FBk8tX4F1fuYLW3ytHjB9jKFmeIsVnIF8YU47mHGX80RuMAG92PCfj3a1mCa1oovd2lZSPl5Zl7lEWloYW94Tws9mEISGUdT3GC2k/5UOKF2XCgiFai154eLkUHhKbgHZ/wKuvsg8u3zAy/QKxloL9ahHTCZYAqtPWR/t6cmmeMZpQAxVrf/fUjNDj5krILhR8iHRX5/P4U+TfNM+oQBoRbjGZmoeGbBS7S53YcwYsVrqdwIzF4ce1EPl5h7wM/qGbf6xMNukncbWbcyic6Gffe4vZRdfbLwqH93ddBadTdVhi1GMJN8PlIunRme2NEXk2ojgxmu2fjwW4/BqWikmCL4JAGQGXqeGr6HXirH6gMyXB7MFcPvXBM9YNoVrL2F0q9516LIh1QEGM6f5jXVXBVWWXwRoceTtScnGjmY0QjKHRtVFPGJRVhDToHO3ILd8FD+/7xoVziN57TRQMiJ2MjcBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(26005)(83380400001)(9686003)(6506007)(66946007)(4326008)(8676002)(53546011)(66476007)(66446008)(66556008)(64756008)(76116006)(7696005)(86362001)(5660300002)(38100700002)(8936002)(6916009)(2906002)(38070700005)(186003)(55016003)(33656002)(122000001)(316002)(52536014)(54906003)(71200400001)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTE2VWtEU0x2aEtmOTBHRW9BTlJabnJ2UFpSb2ZDUG5MVlVta0FoeW5sUlVF?=
 =?utf-8?B?Q2xhRTgvMCtLTWNyRFZtSTczWElONGNlYndmZHFCY0RSM3IydU4vS1RUOE14?=
 =?utf-8?B?Y0ZxNmRPRWlHZUZ1OFRBUnNlclRDQmlib3V6OG1QNTVjZDdKWmZwakJITWNt?=
 =?utf-8?B?em0rZHVTVUVYcGlsWnlWVTZ2cGNtbFord0dIcXdPbys3dmEyK2pGb2kxUjFr?=
 =?utf-8?B?WlZpaU1UNW9IUVpsMlJxUDJOdCtWMUZYc201R2lhU2FXRGpneVpjWjNzOTVD?=
 =?utf-8?B?dkd6azVEUGdrWWpDdlVqYjZRRnNRdTJhNVlHQXZRMStNRGc3T3lTYkd3bXo3?=
 =?utf-8?B?dFNoWklnOEJ1M1cwelpKNXdFdmowN3RUYS9jZ3BzOEhUUkRCU3d5TU9OOEha?=
 =?utf-8?B?eUxDQ00wSUdldkRnMDluRnRyYWVPb3F4cElJVmMrR0VXSiswRmRRbjBmWDBI?=
 =?utf-8?B?bElmQnJBUjV5NDdURGx4eU42TnlBdm4zWkNwNDR2ZzNjL3k3SlhwOWxyMWZQ?=
 =?utf-8?B?MTEzNEplUy9oTE0xMGI3WDIxalhuSnAyYjcvemRnaHJFSkRjTzBhbWdkdmNs?=
 =?utf-8?B?K09TMTFUa29ISW5aZnk5TDU5UHovOHNCREQ3WU9sSHZSdmtOTGd6UE5JMmp5?=
 =?utf-8?B?UzJPK1cweVBScFE3aitkbHN3cllFd1F4dXQzSzkyejdPUi96Wm5mSkdheXdI?=
 =?utf-8?B?dllqUG9vREJ1SkprS0VWNDNFWGZNRmhJdDJEM3U2K2dTQzU0enpvWE1LRTBS?=
 =?utf-8?B?SjZnbUZlbmtUNmRJc2c0ZVpCRDhyOC9TWEtqWk1JWXcySFgwbDBHL0FXajlV?=
 =?utf-8?B?bFNSNmZDUElSbTB6b2w4YitaSGxaVzFEbG9aUlBNaWtuTzYvaWtDM2crOHRX?=
 =?utf-8?B?bHFxeWlnTTE4RXl2aE16YnpUMnRTTFU2V2RWTDVxWWJmK1IrWmk0R0VxSXl3?=
 =?utf-8?B?MUxocEF6OGs1M2JJMm93dTlxMkNma1p5Si80SzltbmhTRFo4Q3duN212VTN5?=
 =?utf-8?B?YnA4K1N6TmY0V1BVRENzMFg1TytKVDR4alM5ZEVGTGoySUJTampISHBnQjNx?=
 =?utf-8?B?TW5QZjR2YkdoYmM0dlFMUHpIemU4WVN3SmluanpMcDRSZ2ZGVUNvenU3UkdO?=
 =?utf-8?B?SElEUWhUMU9OcFkxQmFmTFcxazNEc05aaUgzd2tLWkpoRXR4ZW1abWltdnRv?=
 =?utf-8?B?Rzk3VXNRVkV4UFhiTm5KemFlNzJSTDZGYk9OT0VybWlNbjFDeURUSnNJSmIr?=
 =?utf-8?B?cEQ5WFU1Mm9mVDZERHE5SnRBejd0R1lERlpzYjZGOVNxa1ZrYkl4bWFLRGRW?=
 =?utf-8?B?TGMza21YamZ2c2pWdkdkbXg4Rko4ODdTdWNVUHlaU3VlQjl4V085cnVrT0tu?=
 =?utf-8?B?U1R2eWs4TkllRzlQNkNVMFducVlsdzBPbHpCVGMvUkJyYzh5TnVnWVVoanVl?=
 =?utf-8?B?QVJrTVdpbWF1MTlsOStBcUtuRGF1QjBiVzhDbURTSUdRNWI0UUdZVlltR05U?=
 =?utf-8?B?Z3I2TG1Ld3dQT045c3FreFNMZzNFa052c1pzcnhiaG1kVGNNYWJYbWRySnU4?=
 =?utf-8?B?TG1TTTBUMmw5Q3cvMXd4ZmxsRnlUNmUycmxvL2l4eWNxWUk4VmF1Vm02Qjdo?=
 =?utf-8?B?L3lZL1F4amZlUUZMZjlBQmdiUXd3OSsxQkhiUDJpQ1VaUmNQdTMyb29jTW5E?=
 =?utf-8?B?amN0blVGdkZSbDRxVHZCcVBsMzBycEY3RTYxV3lFV2pxRTBjdzBGNEcybUg3?=
 =?utf-8?B?ZDcrNlZvclJwWnZYMXQ1RnNnWUlKQzc2bUZjZU1lbWp1MktiN1ZiamRBZmlO?=
 =?utf-8?B?L25oazlOVm5BUzZkTk80c0xFY0ZWZTFWRDFLOWFPTmhDeDRBa1I3dTlKQ29n?=
 =?utf-8?B?ZldyUG9WcjUxZm9YY2tLT3lQMjNOd3ZkTWErbWUvaExUMDNWZ0VTcXpOSlJp?=
 =?utf-8?B?RndvWWZWUmxEWU1QaEl5NERTMnJPQzBISWEwM1J3dVcyWWlFYnF3UVI1TUdx?=
 =?utf-8?B?VFFTcHJxeXJzM2x1YndYRGMrVWwwWHNFRE1PRi9VYUdyNzBHVzhWdnpIMUYw?=
 =?utf-8?B?RlJnUzI3MXVETno4all2TEp6SWhCcHUvUWZuWWVOb1JtbVdGejcyZkRmWGpx?=
 =?utf-8?B?UjVvSHZQNzhUdzBsVm93Z1lNd1ZOaHFuM0htY21aSmcyZFpxZ1d4N29HYjR2?=
 =?utf-8?B?bkwxZXo5VWY0OVZxdHV2MExjY2F5QkdhSGE5cWRZRHVkUUZhalhkdStWYmlB?=
 =?utf-8?B?UFk3ZmhCUUZQTFlDenloTDdqZk1jSnBlcHh0MWFhQStGYndvalozSDhnNXox?=
 =?utf-8?B?SEt6VW1XTFJuRmhweEZYRzVRZHZpTWVOTi9QMmdWazVBRDNYL2E1OGM3a29I?=
 =?utf-8?Q?6ja7PIRtGcrXeznE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba0656e-4532-43e4-df70-08da24536927
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 11:29:49.1282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZtZcfbNKbZ8Es5q02j6gy8wcAOzisjUJ0+ZNdzzemWTFyaUwDelj5nwCXsRimDaGf18Ab7HTofjar9qoo0i46xqAWvTSxaGpQhlia0s1Ug8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDIwIEFwcmlsIDIwMjIgMjI6MTMgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBXZWQsIE1hciAzMCwgMjAyMiBhdCA1OjQxIFBNIFBoaWwgRWR3b3J0aHkgd3Jv
dGU6DQo+ID4gRGVmaW5lIFJaL1YyTSAoUjlBMDlHMDExKSBDbG9jayBQdWxzZSBHZW5lcmF0b3Ig
Y29yZSBjbG9ja3MsIG1vZHVsZQ0KPiBjbG9jaw0KPiANCj4gVGhlIGRlZmluaXRpb25zIGNvbnRh
aW4gbm8gY29yZSBjbG9ja3MsIG9ubHkgbW9kdWxlIGNsb2NrcyBhbmQgcmVzZXRzPw0KPiBQZXJo
YXBzIHlvdSB3aWxsIG5lZWQgYSBjb3JlIGNsb2NrIGZvciB0aGUgRXRoZXJuZXQgcmVmZXJlbmNl
IGNsb2NrLA0KPiBsaWtlIG9uIFJaL0cyTD8NCkl0IGxvb2tzIGxpa2UgcnovdjJtIGhhcyBhIGdh
dGUgZm9yIGV2ZXJ5IGNsb2NrLCBzbyBubyBuZWVkIGZvciBhbnkgY29yZQ0KY2xvY2tzLg0KDQoN
Cj4gPiBvdXRwdXRzIChDUEdfQ0xLX09OKiByZWdpc3RlcnMpLCBhbmQgcmVzZXQgZGVmaW5pdGlv
bnMgKENQR19SU1RfKg0KPiA+IHJlZ2lzdGVycykgaW4gU2VjdGlvbiA0OC41ICgiUmVnaXN0ZXIg
RGVzY3JpcHRpb24iKSBvZiB0aGUgUlovVjJNDQo+IEhhcmR3YXJlDQo+ID4gVXNlcidzIE1hbnVh
bCAoUmV2LiAxLjEwLCBTZXAuIDIwMjEpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBF
ZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL3I5YTA5ZzAxMS1jcGcuaCB8IDMzNyArKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMzcgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yOWEwOWcwMTEtY3BnLmgN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I5YTA5ZzAx
MS1jcGcuaCBiL2luY2x1ZGUvZHQtDQo+IGJpbmRpbmdzL2Nsb2NrL3I5YTA5ZzAxMS1jcGcuaA0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5iODhkYmIw
ZDhjNDkNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9yOWEwOWcwMTEtY3BnLmgNCj4gPiBAQCAtMCwwICsxLDMzNyBAQA0KPiA+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4g
KyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAu
DQo+ID4gKyAqLw0KPiA+ICsjaWZuZGVmIF9fRFRfQklORElOR1NfQ0xPQ0tfUjlBMDlHMDExX0NQ
R19IX18NCj4gPiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX0NMT0NLX1I5QTA5RzAxMV9DUEdfSF9f
DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcmVuZXNhcy1jcGctbXNz
ci5oPg0KPiA+ICsNCj4gPiArLyogTW9kdWxlIENsb2NrcyAqLw0KPiA+ICsjZGVmaW5lIFI5QTA5
RzAxMV9TWVNfQ0xLICAgICAgICAgICAgICAwDQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX1BGQ19Q
Q0xLICAgICAgICAgICAgIDENCj4gPiArI2RlZmluZSBSOUEwOUcwMTFfUE1DX0NPUkVfQ0xPQ0sg
ICAgICAgMg0KPiA+ICsjZGVmaW5lIFI5QTA5RzAxMV9HSUNfQ0xLICAgICAgICAgICAgICAzDQo+
ID4gKyNkZWZpbmUgUjlBMDlHMDExX1JBTUFfQUNMSyAgICAgICAgICAgIDQNCj4gDQo+IE1pc3Np
bmcgUk9NX0FDTEs/DQpZZXMsIHdpbGwgYWRkLg0KDQo+ID4gKw0KPiANCj4gTm8gbmVlZCBmb3Ig
dGhpcyBibGFuayBsaW5lLCBhcyB0aGlzIGlzIG5vdCBhIHJlZ2lzdGVyIGJvdW5kYXJ5Lg0KQWdy
ZWVkDQoNCi4uLg0KPiA+ICsjZGVmaW5lIFI5QTA5RzAxMV9DU1RfQVRCX1NCX0NMSyAgICAgICAx
NA0KPiANCj4gTWlzc2luZyBDU1RfVFNfU0JfQ0xLPw0KPiBZZXMsIGl0IHNoYXJlcyBhIGJpdCB3
aXRoIENTVF9BVEJfU0JfQ0xLLCBjZnIuDQo+IEVUSDBfQ0xLX0FYSSBhbmQgRVRIMV9DTEtfQVhJ
Lg0KQWgsIHJpZ2h0LCBJIHdpbGwgYWRkLg0KDQouLi4NCj4gPiArI2RlZmluZSBSOUEwOUcwMTFf
RVRIX0NMS19BWEkgICAgICAgICAgMzUNCj4gPiArI2RlZmluZSBSOUEwOUcwMTFfRVRIX0NMS19D
SEkgICAgICAgICAgMzYNCj4gPiArI2RlZmluZSBSOUEwOUcwMTFfRVRIX0dQVFBfRVhUICAgICAg
ICAgMzcNCj4gDQo+IHMvRVRIL0VUSDAvIGZvciB0aGUgdGhyZWUgYWJvdmU/DQpXaWxsIGRvLCB0
aG91Z2ggdGhlcmUgaXMgb25seSBvbmUgZXRoLCBFVEgwIG1hdGNoZXMgdGhlIGRvYy4NCg0KLi4u
DQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX0dSUEFfUENMSyAgICAgICAgICAgIDcwDQo+IA0KPiBD
UEVSSV9HUlBBX1BDTEsNCk9rLCBJJ2xsIHJlcGxhY2UgYWxsIEdSUCpfUENMSyB3aXRoIENQRVJJ
X0dSUCpfUENMSw0KDQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX1RJTTBfQ0xLICAgICAgICAgICAg
IDcxDQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX1RJTTFfQ0xLICAgICAgICAgICAgIDcyDQo+ID4g
KyNkZWZpbmUgUjlBMDlHMDExX1RJTTJfQ0xLICAgICAgICAgICAgIDczDQo+ID4gKyNkZWZpbmUg
UjlBMDlHMDExX1RJTTNfQ0xLICAgICAgICAgICAgIDc0DQo+ID4gKyNkZWZpbmUgUjlBMDlHMDEx
X1RJTTRfQ0xLICAgICAgICAgICAgIDc1DQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX1RJTTVfQ0xL
ICAgICAgICAgICAgIDc2DQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX1RJTTZfQ0xLICAgICAgICAg
ICAgIDc3DQo+ID4gKyNkZWZpbmUgUjlBMDlHMDExX1RJTTdfQ0xLICAgICAgICAgICAgIDc4DQo+
ID4gKyNkZWZpbmUgUjlBMDlHMDExX0lJQzAxX1BDTEsgICAgICAgICAgIDc5DQo+IA0KPiBJSUMw
X1BDTEs/DQpUaGVyZSBhcmUgZm91ciBJSUMgcGVyaXBoZXJhbHMsIHRoaXMgcGNsayBpZiBmb3Ig
aWljMCBhbmQgaWljMS4NCldvdWxkIElJQzBfMV9QQ0xLIGJlIGEgYmV0dGVyIG5hbWUgZm9yIHRo
aXM/DQoNCj4gPiArI2RlZmluZSBSOUEwOUcwMTFfSUlDMjNfUENMSyAgICAgICAgICAgODkNCj4g
SUlDMV9QQ0xLPw0KYW5kIElJQzJfM19QQ0xLPw0KDQouLi4NCj4gPiArI2RlZmluZSBSOUEwOUcw
MTFfSUNCX0FDTEsxICAgICAgICAgICAgMTQxDQo+IA0KPiBNaXNzaW5nIChzaGFyZWQpIElDQl9H
SUNfQ0xLPw0KSSBkaWRu4oCZdCBjb25zaWRlciBhbGwgdGhlc2Ugc2hhcmVkIGNsb2NrcyBhbmQg
cmVzZXQgYXMgdXNlZnVsDQp0byBhbnlvbmUuDQpBcyBmYXIgYXMgSSBjYW4gdGVsbCwgbm90aGlu
ZyB3aWxsIG5lZWQgdG8gZ2V0IHRoZSBjbG9jayByYXRlcw0KYW5kIGFueXRoaW5nIHRoYXQgbmVl
ZHMgdG8gZW5hYmxlIG9uZSBvZiB0aGUgY2xvY2tzIHdpbGwgbmVlZA0KdG8gZW5hYmxlIHRoZSBv
dGhlciB0byB1c2UgdGhlIEhXLg0KDQpTdGlsbCwgYXMgdGhlIGJpbmRpbmcgZGVzY3JpYmVzIHRo
ZSBIVywgSSB3aWxsIGFkZCBhbGwgb2YgdGhlbS4NCg0KPiA+ICsjZGVmaW5lIFI5QTA5RzAxMV9S
QU1CX0FDTEsgICAgICAgICAgICAxNzUNCj4gDQo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZGVj
b3VwbGUgdGhpcyBpbnRvDQo+IFJBTUIwX0FDTEssIFJBTUIxX0FDTEssIFJBTUIyX0FDTEssIFJB
TUIzX0FDTEs/DQpXaWxsIGRvLg0KDQpUaGFua3MNClBoaWwNCg==
