Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96D157C63F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 10:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbiGUI2v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 04:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiGUI2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 04:28:48 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742397E318
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 01:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658392128; x=1689928128;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wBDwWYFM/a6/bPa53Ab7OHjrihpEXqFD3OZgtXSEYOM=;
  b=J4x6adErRsaedY1RaBLmnJKMG5Z+lGl1kAT41FClSEAOgAxJTt/CdUW0
   LEaIHPSEbNAED34bHD56zveoeFX01QlfudjSDpnoX/lHl777f6OicxW13
   tl6fG+qL8MrMszsj/62rZdFzM9JgPTY/baJAeN2uNoYYFvlMI8u2LzQye
   rlZXmNJk8tJTXP0bE1iUUlEOARzgqmH77Y3N5ObXZiO/jyxvgYg5vZgwW
   h7rF0DPlyhb1NSY2VaNgpofDaY/95f1Iy1L7489P53CiuuW7f0dFiWKjN
   hStmad8yR8/dgMw6QIytfWa26aoDw4pEDEWE5Br/3DGCtpSKac83BSYUr
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="165756315"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 01:28:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 01:28:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 01:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLQuCMCPHU4+6Ps/4AVwapTt9wXYsZs3qwwTDNYD30olsoPBlMhDDd23Bp1ERTVvmpGmrhR/HbWQeMNpkL5DMWNrJM8fo4rlnFBg0uozBxRRVFeYG05x7gid4pJBbeDi852HkUfsaBkR/eKbjsFrTbCAjwAR9R+3ygj9MTDQtAtZJvpjafG7dZK2pt9L6DE/RyhrZfe5qhYheCpvnPM+k31H/cf3g2LAqqesGrTPoZL4rpImwFJRnhLIUkivQ2IakyMomQFuf0Z8lGvj76H8mRo+GvBYr1oXTdtfWuItVFQ4TWSwINTvbZCb4gAiI5YAzll+sVAcVxXJWAt68zJvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBDwWYFM/a6/bPa53Ab7OHjrihpEXqFD3OZgtXSEYOM=;
 b=G5k10jbnzxUDbpMGjOT7MBwT7gkas7rwLAq8pidNaLPD3g3L41FYFz/ABAWVTYUpp4iJL/eUpAke4W0ZzklR31TcyNvzqyfI7eeDHqN1Q+tkj1cs4sHe1FYQh4WSl8iW//9NUTgafKvfkM1UmBuUxhGdg6S2/xIYfTeaYv1HPsAGeDjuZiVcq3nU8JFK5irCiHuNJ+5Xl0IVD/eD1UDgis2fqkzZDupeOxz8woavV1w5iLNzHxbQa67PdN6Xt5aT322ue2iIowhH79opmsYLodMn6qi94aHYQqbW3RUDV6oqYM6irbS2W3oxK0+paYPsIo4GagtqfO9lSHq7syip3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBDwWYFM/a6/bPa53Ab7OHjrihpEXqFD3OZgtXSEYOM=;
 b=CSgTlGVkfmfXm+qta+RiDVDH0xmMRuH7xzf80pxEgpUvfXymuWEMOp23eZI0njinRIc8gDyL+7J5BEKyWfcY0iSdqQo9WuVrDwXaoRtDj8ayW/TR9eXc7n5VLxPUEYj5DQ/jrOEaVF96RSN62vQNx2ZPXSZv6vpeDwajEvN0OiQ=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 21 Jul 2022 08:28:43 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 08:28:43 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <biju.das.jz@bp.renesas.com>, <p.yadav@ti.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC:     <michael@walle.cc>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Claudiu.Beznea@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <geert+renesas@glider.be>,
        <Chris.Paterson2@renesas.com>, <biju.das@bp.renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Index: AQHYnNvhSu/G76y6X0CbqZjid5ETZA==
Date:   Thu, 21 Jul 2022 08:28:43 +0000
Message-ID: <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ac6e998-210a-43d7-4078-08da6af305c3
x-ms-traffictypediagnostic: MW3PR11MB4732:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DISzeVsbyuktHHAmTQMWWvvvH1v92qr83tJ+T7KHWUr6f7wslOuVGz1UwQTbiMqrgpoVnBsjJqFEIoi4qxYe1rV1vWcp0YRWkLIGsGDpQ9qkHI3x5lu7Z0arHwyGTkNHInypLK9FlrnQ4WL9ojgzAIb0e/bIP1l9cA+J+GQQafZk1v3/pbE6IFbG/A1+U/FL28rFXK9lFlcdcevNux/6PmxnU5GCFLIg71W3Bq8rjYrlH9jn1sG0mEcnGX2/nCDcPZS0o+pgUqrZo7pvNONUNFl7lk/rkuX+qBdOwTOxzWVdT14b71rJXNkitouD1I8uQhuLrEJ35A6tuX2AZNRODHH8WgUIXD+Ul0CIMfAZSE0K53lJ8J0dRP/AaI+K8MMGbd+jQb/XLKI36VQGtQDUimrMOGH2o5v5bY+YOK9TH9Io5yV+Z7tGZSY3h3c7Ml3EnEC5qN4m4BCW6cX7NURiz5er+DkxdItjBy9huS8Oz/23nRt3TMAxFqbeFrY65SzTAcKYi0dh/3vO54JgVI7EpmmG8OMadApLQmSUvdtKaUNxyeS6LRp2n7orlPG9SPLQZBCrKM0oKndornb+ZZYA2AXKkwBe7mmhIBElRv9ehDBEak2SzNkVNlUj0Isy4Y0+ze+d+gN3OZajTAFDk4d08O3GS5w7W+Zr3vXSGEiRpeCeFUN7KjZzZ34SLI0/aMzUCWaoVfhEtHlJou9ge71UAiST+zjj4LH3NqRDT0OtZqvy1nzf2e+oCsD+Pb/qpNqOQSglVnh8I2wqB3vR9vdnSNjyjMOFLSXiGwDIBuDnoUyujb9b9oGsqJGfX4eYY+6f3blAhGWLpaKVXgpZq2gmKDakZEiyAcqxyXWItHimDTKTP/z2SllPc2QYHGPoNzaA3wxwXXKh+doltD1ju+/s4PCvltGXTZruVHyUyQzmHsXrdYFwtlX1SPNPb0tKiUn9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(136003)(376002)(186003)(53546011)(2906002)(26005)(64756008)(4326008)(6506007)(2616005)(6512007)(38100700002)(31696002)(86362001)(83380400001)(38070700005)(8676002)(6486002)(122000001)(316002)(41300700001)(966005)(110136005)(66946007)(54906003)(76116006)(478600001)(5660300002)(91956017)(7416002)(31686004)(71200400001)(66556008)(8936002)(66446008)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGRyRUxibUFpWWx3Wlg4MjlZL09hRENZWTVsVjVjNGt0a3dmd0tzR0ZrM3pG?=
 =?utf-8?B?L1NpS2psYWFaNWlyUHFSaU9YaDVZTzJKMm55bkNJL0h2cFVFT0N4V29LdmlP?=
 =?utf-8?B?U0llQmZhSU11SUhmOHF0MXRIcU1pSkU4TDlCU1dwQU03NCtBUzY4U3ZNWE4v?=
 =?utf-8?B?QzhuQmRjY3pOUDZJc3lRZnI1bVhqVW9OQUtGRmpnT21QcHpRZTlMK3lzZ01Q?=
 =?utf-8?B?YzVlRElOR0kwTk1CaWZ3OStMTjJEbE9QK29iWFI0RVZvc1dRYkRvMExVbEJZ?=
 =?utf-8?B?SnNIQTdPd1cyZjJJR3h3bXhJaW5JSnBXeE9xYXJ5WFRSNG5iRUpPWk5qTDN5?=
 =?utf-8?B?bSs5VjN0QjZuTHpOSW5JWmphL1A1SUJ3T29GZ0YrcEZ4RHZVeENYdkZ2NmxW?=
 =?utf-8?B?cWhQYzJVNloyNzVsSVExdzZCNkl2TGVmd2M1YXkwMVc1RGtTMGdvOG9TZjRD?=
 =?utf-8?B?bFhqcDFUd1dyMW5Gb3NYb0oraVFkdGVDRkRhUUxQdUViSjRqb2dTNE5OUWNv?=
 =?utf-8?B?TFJmSmQzV0duNVBtOFA2cG1mTE5DMkJIRnl4UURhQ1o5VTZ4djJXeFJ5NCtr?=
 =?utf-8?B?Qys3QnpCNXlac3NUcFFRMVRLZmZlbFFLNG5tckZOYzA3M1dlUTRaWXhUKzhq?=
 =?utf-8?B?NDU5UzhiSTZQdTYzYkZxb2F4bnhib0l2L2dNN29kYTliT1NlRGdLZElKN1FC?=
 =?utf-8?B?V1JaSnF2WncrVWRiWjkvUDlwQVRLRVd4TkJaVHlZR0xJL0wxaU5LeXUvenhw?=
 =?utf-8?B?Mmd2NzEzeXN6dktjK1dvSVV3czg2WHRJUnNDejZjQTk5VUdhUk5rNGlwUmlB?=
 =?utf-8?B?VGJPNUYvcFVQTzBxbXJ1SHVzZUNrREJpSnQyNzl3U1lOOTI4UTY1YmdMejMx?=
 =?utf-8?B?Qk5hVnNaWVpaN09Ga0Y3bTlUZ0I4YU1EMFRlS2FHSjY3YmF6dnlJSTdwS3Ji?=
 =?utf-8?B?a2x0OURsQ012akhrcTlzYmJZTWM5bU1Ic25XUDNOTlFuZjZMOGdkK3NQam95?=
 =?utf-8?B?V1FyY0I5d0lTOE9KWDREcXFBMndvQjFKeEFVZXlTTkxjQ1pDVjJlaUVUdGdF?=
 =?utf-8?B?Y29ETThvdG1yZ3NIZENLVTRLenNCUnJEenk3b3R3U1V0UlFFYzJzOEFaYmZR?=
 =?utf-8?B?bFN3YnY0cWJTUFUrNnEzdnFIMVhtTXI2ZmZMTzBDNFpxNTJ1VDMwbHAxSC9M?=
 =?utf-8?B?UDdKUnhKZzRqTkRzRHBPakNHU1l3b2dpa1ljNFlKaG1WUmxVSHBFVjJxeERu?=
 =?utf-8?B?VVdYcnVDc0RqRXAxMVl2TlFMMFlmU3cvWE94Ty82Tk4yL01XWnlnbCtNU1Vy?=
 =?utf-8?B?Vy9kazluN1VBemZQNStadzM1c3p6ODlWeHJTTjhYZ0c1M0lrVEoxWTllS0x6?=
 =?utf-8?B?S2xGVFlwWGdRWDU2ZGhpZThGNmQvK3ppT1QvWDc3WEJsQ3lsL1ZCUTNyTWln?=
 =?utf-8?B?OWJibXhLclNPaG5UUWFTVDhWcWhVL0NvL1FZV1l3bEVOTDEzRnZMaDJpOG96?=
 =?utf-8?B?VjFHR0pBVXVLRzk4ZVUwOXJHemg1QXhzR0pFQmczSDA4NDU3SmdrdnRaR0Js?=
 =?utf-8?B?TTlmeGpuUk9LbnV4S1hkUWlMUmxta1Z4b1Q4MGtlY1FIZTZ1ZUVicCttTU1N?=
 =?utf-8?B?QjBXUzlPTHBlQzZzbnE3dERoNlpua3IweHdob2N3eEswRjFMSFpYTGpZRWp1?=
 =?utf-8?B?VHliZmljanVGeWJtN2pSTXBpVkVMMUozYXpUVWJUQjU1cTRiMVY3NVJGdlQy?=
 =?utf-8?B?TGxzVVZXTjlOMUF4UzRCMVZpblpDaEpSUURPR3JjY1I1NHRsN2ZoZENkWHRq?=
 =?utf-8?B?Q0xqUEkrU09hNmJ4YWxXY2RtUlBabzJkZGdMb2IwaWFwS1FFcHN5b3JicjJj?=
 =?utf-8?B?OGNqUU1maVEwNitaK2dUTlFFZTI2ZTV1WVFndXlRczdNOVh2MXpUOGFnSFg0?=
 =?utf-8?B?NG9xSWxTMWVIcFlCUUJ1d3VSdnhoQkU3N0kyNnlaSkZLZnRHdTNHc3pLNTFp?=
 =?utf-8?B?NklaMnltNkI2ZmtiVk9QYzBMc00wREtLSXUrV2dULzZkZFJsQkdjTEdZNFh2?=
 =?utf-8?B?Sm9DUnE5OFJrMEZvcTk1MDZvYUZ5RXpFY1lpZ05qS1l1Nm5PSVJZT1B1UW8w?=
 =?utf-8?B?YXJzN3pmazdnaXRBZUFkd2Q0MFJrL1RCNCswVXdnZ0VHVVZ2eXlybVZrWmlr?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF60A1A85B166B48AA6B6A1C15E95E0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac6e998-210a-43d7-4078-08da6af305c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:28:43.2469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQ6AAHM2TQG0WZj5DAJpNZCTtzRmM0XiJARzPX6pkTi6rRTp4zmtj64286oMXBWPsxzKrWjUQKwUtqAPGGSpVhs8RF3VsvSysaXpGuPD6/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gNy8xNS8yMiAxMzo1NywgQmlqdSBEYXMgd3JvdGU6DQoNCkhpLCBCaWp1IQ0KDQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIFJlbmVz
YXMgQVQyNVFMMTI4QSBzZXJpYWwgbm9yIGZsYXNoLg0KPiBEZXRhaWxzIG9mIGZsYXNoIGNoaXAg
Y2FuIGJlIGZvdW5kIGhlcmUgWzFdDQo+IA0KPiBbMV0gaHR0cHM6Ly93d3cuZGlhbG9nLXNlbWlj
b25kdWN0b3IuY29tL3NpdGVzL2RlZmF1bHQvZmlsZXMvMjAyMi0wNC9EUy1BVDI1UUwxMjhBLTEy
OUYtMDIyMDIyLnBkZg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiAtLS0NCj4gJCB4eGQgLXAgc2ZkcA0KPiA1MzQ2NDQ1MDA2MDEw
MWZmMDAwNjAxMTAzMDAwMDBmZjFmMDAwMTAyODAwMDAwMDFmZmZmZmZmZmZmZmYNCj4gZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZTUyMGYxZmZmZmZmZmYwNzQ0ZWIwODZiDQo+
IDA4M2I4MGJiZmVmZmZmZmZmZmZmMDBmZmZmZmY0MmViMGMyMDBmNTIxMGQ4MDBmZjMzNjJkNTAw
ODQyOQ0KPiAwMWNlZWNhMTA3M2Q3YTc1N2E3NWY3YTJkNTVjMTlmNjFjZmZlODEwYzA4MGZmZmZm
ZmZmZmZmZmZmZmYNCj4gZmZmZmZmZmZmZmZmZmZmZjUwMTY1MDE5MDAwMGZmZmYNCj4gDQo+ICQg
bWQ1c3VtIC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkv
c3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL3NmZHANCj4gMjNlM2VjNTZiNWI4Zjk4NmQw
NDg4YmE0NzI3MjM5ZGQgIC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3BpL3Jw
Yy1pZi1zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL3NmZHANCj4gJCBjYXQgL3N5
cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNwaS9zcGlfbWFzdGVy
L3NwaTEvc3BpMS4wL3NwaS1ub3IvamVkZWNfaWQNCj4gMWY0MjE4DQo+ICQgY2F0IC9zeXMvZGV2
aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkvc3BpX21hc3Rlci9zcGkx
L3NwaTEuMC9zcGktbm9yL3BhcnRuYW1lDQo+IGF0MjVxbDEyOGENCj4gJCBjYXQgL3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNwaS9zcGlfbWFzdGVyL3NwaTEv
c3BpMS4wL3NwaS1ub3IvbWFudWZhY3R1cmVyDQo+IGF0bWVsDQo+IHYyLT52MToNCj4gICogQWRk
ZWQgZmxhc2ggZGVmaW5pdGlvbnMgaW50byBBdG1lbCB0YWJsZS4NCj4gUkZDLT52MToNCj4gICog
TW92ZWQgdGhlIGZsYXNoIGRlZmluaXRpb25zIHRvIGF0bWVsLmMNCj4gICogUmVtb3ZlIG1hY3Jv
IHJlbGF0ZWQgdG8gbG9ja2luZyBhcyBpdCBpcyB1bnRlc3RlZC4NCj4gICogUmVwbGFjZWQgSU5G
TyBtYWNybyB3aXRoIFNOT1JfSUQzDQo+IA0KPiBSRkM6DQo+ICAqIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDIyMDUwMTE4NTUx
Mi41MTE1OC0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KPiAtLS0NCj4gIGRyaXZlcnMv
bXRkL3NwaS1ub3IvYXRtZWwuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9hdG1lbC5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9hdG1lbC5jDQo+IGluZGV4IDY1NmRkODBhMGJlNy4uODBjMjRkMTM4
YjI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2F0bWVsLmMNCj4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9hdG1lbC5jDQo+IEBAIC0xODYsNiArMTg2LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGF0bWVsX25vcl9wYXJ0c1tdID0gew0KPiAgICAgICAg
ICAgICAgICAgLmZpeHVwcyA9ICZhdG1lbF9ub3JfZ2xvYmFsX3Byb3RlY3Rpb25fZml4dXBzIH0s
DQo+ICAgICAgICAgeyAiYXQyNXNsMzIxIiwgIElORk8oMHgxZjQyMTYsIDAsIDY0ICogMTAyNCwg
NjQpDQo+ICAgICAgICAgICAgICAgICBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsgfCBTUElfTk9SX0RV
QUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LA0KPiArICAgICAgIHsgImF0MjVxbDEyOGEi
LCBTTk9SX0lEMygweDFmNDIxOCkgfSwNCg0KQXMgdGhlIGZsYXNoIGlzIGRlZmluZWQgbm93LCBh
bGwgaXRzIGNoYXJhY3RlcmlzdGljcyBjYW4gYmUgZGlzY292ZXJlZCBieQ0KcGFyc2luZyBTRkRQ
LiBTbyBpbnN0ZWFkIG9mIGFkZGluZyBhIG5ldyBmbGFzaF9pbmZvIGVudHJ5IGluIHRoZSBhbHJl
YWR5DQpiaWcgYXJyYXkgdGhhdCB3ZSBoYXZlLCBJIHdvdWxkIGxpa2UgdXMgdG8gZm9jdXMgbW9y
ZSBvbiBhIGdlbmVyaWMgZmxhc2gNCmRyaXZlciB3aGljaCBhY3RzIGFzIGEgYmFja3VwIHdoZW4g
dGhlIGZsYXNoIGlzIG5vdCBmb3VuZCBpbiB0aGUgZmxhc2hfaW5mbw0KYXJyYXkuIFdlIGNhbiBk
aXNjb3ZlciB0aGUgZmxhc2ggcGFydGljdWxhcml0aWVzIGJ5IHBhcnNpbmcgU0ZEUCBhbmQgd2Ug
Y2FuDQpwcm9iZSB0aGUgZmxhc2ggYmFzZWQgb24gdGhhdC4gTWljaGFlbCBoYXMgYWxyZWFkeSBz
dWdnZXN0ZWQgdGhpcywgd291bGQgeW91DQpwbGVhc2UgaGVscCByZXZpZXcgaXQ/DQoNCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA1MTMxMzM1MjAuMzk0NTgyMC0xLW1pY2hhZWxA
d2FsbGUuY2MvDQogDQo+ICAgICAgICAgeyAiYXQyNmYwMDQiLCAgIElORk8oMHgxZjA0MDAsIDAs
IDY0ICogMTAyNCwgIDgpDQo+ICAgICAgICAgICAgICAgICBOT19TRkRQX0ZMQUdTKFNFQ1RfNEsp
IH0sDQo+ICAgICAgICAgeyAiYXQyNmRmMDgxYSIsIElORk8oMHgxZjQ1MDEsIDAsIDY0ICogMTAy
NCwgMTYpDQo+IC0tDQo+IDIuMjUuMQ0KPiANCg0K
