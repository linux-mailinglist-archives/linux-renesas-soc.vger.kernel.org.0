Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE4C57C7D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 11:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiGUJkA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 05:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiGUJj7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 05:39:59 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763AE80F7A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2022 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658396398; x=1689932398;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rois3cQzf0SgCbYqk1Q0b6b1oq1z7UfT0J01P90SxdI=;
  b=jeXbD+VKIq1G6LJGBaA77hGDEORKFKSKnD4n8vvO8G/S8hH8F3midhTE
   io8DVjHwR7X1jPhhe3g5DnpRtVML3a5PrKjRsAJG4HQ2x1FnUwjSmZRhr
   s683iE6ULbcPlDSBDeDjFNQN3EC88g4kh3t19uXZKHGmRMyvssZ65L/SY
   jQe2u4bXNrQOHFtzlA3BgjZVeeLBYs16OoGBhUsB0K0h6xjHEoPYK7rXZ
   n7HdEuM3diEVZ5GbgnI1Zb58ooTl91sy6DR45eg9/cP2KvAEKuykNjQxR
   3CihKqrR08lqCSuKChk0oXSoEUeW3B261C6h9oPtLcxKANPjNckXuB2oc
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="183143355"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 02:39:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 02:39:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 02:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGB5KVmXz64UAwg8Z7h/Oc/B9CbjCYiE9+xUeAu0fdplZm3/8zz6GukP+mxKA37V+yHZadgspgeup0iELsWvD5Hbj61adrvzSDyrsO9sehAEao1khmsnEsZuCxUiTxGkargmOT98xIgkv1KzLleJoGLZ1uMWlzYfCrResiWdUh04i97AD7ykIKjJ6TONzn1dw9ARPBZw4YFQkt9PLikW5ukdmznR/YSSzrHziAEoiD+2fwDvBsoY9OYJClMpJx3wX1AA1MRUugO9OhIBsomeVKatfUrIbwkXnGj8VpUk80k5493+miaDbgwnWzUH9U+eqIlTQpXwr+IHokz9eR9TrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rois3cQzf0SgCbYqk1Q0b6b1oq1z7UfT0J01P90SxdI=;
 b=Tp5LZ4fSyntLszH5JTMQ4GrHukI/yIEolALBtAEDJdMDPKu3kECk3lmxXLqmFDDKL3XmdInbJ+phQYkEW/kreG2Hv7i9OnvoiMlgExeAMSnlRu1D9mC9JqGEQuNM2sK6AGK3ohdLerTNO4opdDZXcuP1b9q3nLiReWNYSQs+CFlBUXQdrAvQvrFLKO0LTAeBPUOuJ8mPfvL3UjvYThuh209wg2apjrGZLx6MdEPZa5LY+TG7V5DXQKxxQmBvUEzDfcOmoI3Yaog9HuyhY4BES2XsufwdCr5auRCely9Asq3KhCbMD/HFPXE5YRba+3nhIkYHSMHdhyf6zFeu7bMqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rois3cQzf0SgCbYqk1Q0b6b1oq1z7UfT0J01P90SxdI=;
 b=DgbV44j5G/zKyfdpZsxKIhpBC3xT4CfekldVJ7WMFiecAoyBXk6dcoRTiebXXO3J7V6wK9Go101QkW5YKML5eGS0JRYomfiFdL+zyHoYp53t9nv9BPFcHp29DoaJjdyshRpA70x/DmaRCxSNZiABNkHaBKG3hqCfLpoDSbj+ZJU=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM5PR11MB1804.namprd11.prod.outlook.com (2603:10b6:3:114::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 21 Jul 2022 09:39:54 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 09:39:54 +0000
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
Date:   Thu, 21 Jul 2022 09:39:54 +0000
Message-ID: <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2823eb8b-3457-4a2f-7dfb-08da6afcf7d2
x-ms-traffictypediagnostic: DM5PR11MB1804:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WOvsPxpgh0tUcl3GLdLA23W2GGB0r+fWYYa+EA7XBh4/LA9tVdK8hKgpWtEyME8VhqxK+vPsxtBFaIxNsbAwjOTNGsqkqSqaREMIn6FfnHKDt6Bzu+dc72QZHTjaAdFzBEjAMDf3YqBHY0PSQfzwcWSTfXFHtmjGSQCwYe/0jKK2akpvytvVEDWJ5N/COrqtzbpEuefT8tcynBV/lXpgy3nHM/F0316yKTIyr6Q2rYlgz7F9CFLehWyrrU9Fn8qcc6Vj5cqErlub2SlG9pdpI07ha83SUIqGx3cO2llWxFZsB9yjawK8gQ/7DB3QXjim1wg6M68OJu1MCK9MhSygjbrFPtDkfFZowdJe6gwOlfjhOwE94KrmqxMRmVQcY8JMhvHRzKemwJpVTIzVFoCGm0nr5tVKj4zbvIW86f3FkgsIadVMcnaRfcQuxUPFdDpCA47LYWnP72WHzAypJSkbE8zTiAv9v3fnV/2xnfmCh+PcWYp7LGej9z1Sq1bXzkk/vpqijZNeai68Ja5Z/ld051wSeuQnWY+CtWsy2yXY5d5R7fZtHeCtmjLE3QLALw3E6t8aF9MBfiKgyzpAE1V2Eae6HBtpFBxdUshfUHi3CJE2sQj/veAlWeFYUmly0LgAIRj4jDfkPjCyoVaT3Hvr3+kA3UEAzVhgXEymUFa4X3oDDOpxglUWFrE1GKGsovv9fiadvyGtsPuTnpdWptRhVPZJPrMkQ4TPSilbF9QsVRhBI/9WuJYAdsZjccQ047bk4Z6uh0hVqyxUdRWj1G/0u/w+553f1yg16IokMtMlzU8du51sBaxoi7L6Wx98f2dWw9hqv+ZGo9uA3pSvy2Ui0EzD75I/vDORX7JH8hkurfu3giHR1NE2KNZHLoPip3Vp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(376002)(136003)(5660300002)(66446008)(7416002)(8936002)(64756008)(91956017)(4326008)(8676002)(76116006)(66946007)(66476007)(66556008)(2906002)(38070700005)(36756003)(31696002)(86362001)(38100700002)(122000001)(71200400001)(316002)(54906003)(110136005)(26005)(6512007)(6486002)(2616005)(186003)(41300700001)(478600001)(6506007)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGQ0aWZPV1Z4bSt2dTVKYUJONFJxZTBnWnkybFN0aUZINnVGNTJIZlNSa1pI?=
 =?utf-8?B?Z1BZUE5obS8rUGtjUjdUNTFXRjZlU1JjaGZ3WXVQM05IbFJ4em5FQUxQbTZV?=
 =?utf-8?B?bDMvZzgvcEJBZzZFRWpEL3pUMXMxWWNpcUlwTnJ3enpUdUpSa1o0T2dWT3cw?=
 =?utf-8?B?dTlQVFgyNEpScjFsWVBhWm9VeGV6Y2E4TDlLRFUvV0NtOWxaY2NMand4ei9F?=
 =?utf-8?B?d2orZFdYK1k4VU5RQXc3dUsrMUtJR2ZwNUtWeUFLUTdFT1p6TUVzelZQSWN3?=
 =?utf-8?B?YlgyWExVOFhKNkxJeDdoUEFOT2NlMEdsVWlkWm0rV1ZhbzNNQkUycFpIUnZo?=
 =?utf-8?B?UjlVd0E1VlFsTzYxb2dzaWNEelZjVmZoUTJINUxXd3h6NkNuYjlCVGVDRCtK?=
 =?utf-8?B?bkdQdENpVExzd0R4UCthem5iZG1ERVg4cndQWXpSaG5tSDhHYXM2OVZ5OXdD?=
 =?utf-8?B?LzlQN0MzZW56SWI5N3ZNaW42N2ZiOUs0b3piWEQzbEFBSmppaWUyTWExbVVY?=
 =?utf-8?B?UWtoK2srUTAvYkdZRGQwOWx3dmY4Y0RIZDdRZ202Lzlqb09DT3E3TEIzV0s2?=
 =?utf-8?B?TU1nenhnbFZ0QU9MWmpLd0FITll6d25XWU5nU3pRK25yZDdocnFmR2tUNXF0?=
 =?utf-8?B?TW9XN2kwdkFzZTY0TExNK3BhK3ZjYTB0ckVZejRuazVCaGR5TDJocUNlS21i?=
 =?utf-8?B?VlZPdm1maVd1SUhoTEthMExMb1lFNWpIWEEzdFh3MFdsNmRjT3gwNUJrZDJv?=
 =?utf-8?B?dWxrNE5WaEM3YjlCNWRPRzJ5N1htQUJtNVBpL2piYnhoZnVOeURvcVNQdVla?=
 =?utf-8?B?VDFwVWIrZ3Z6bUdocFRwOFVnMVhINEpaY0tjYVlpc0FoUENNYzlSTElnbFJx?=
 =?utf-8?B?Qm5ZVHFwTHB5ZjBqbHBXZlpNbWJVRGNDQWF4L0E5VDlHZE91R0FzWHRkVTlS?=
 =?utf-8?B?NWNkQ3hoaDNnMlpnbzc5ZU1xUEt2Zlh5NXBiRE9Fd2hRSUw2dFJLQTlvTmt4?=
 =?utf-8?B?djVjWFNodGloOS9nMENUS1lEVzFDa3ZDUE5Ubm5kWG1TeFo3cTRydG9OcXNx?=
 =?utf-8?B?OXBwMjlPWmNocHAxb3NWaHpYNE5KZ2R0dWNybXZJUVhxR25XMmhsNjVxeXN1?=
 =?utf-8?B?VVdBSFFoaFBjOHVjeWNaOVJTZEZaaTkrME0rNmtOUC9SdjN2MGJvMkhEa1lN?=
 =?utf-8?B?aFJBTDkxeWFkNThOS3c1eGNGNXlmK3Z2cmQzaTUxaHZSaU4rbndHcGNXTkU2?=
 =?utf-8?B?cXRJbW5LRmkzWkJjNzJ0Yk1LVE4rMkx3QW9nd0VZR3M0cXNWNmEwa0VaSkpS?=
 =?utf-8?B?cjFaRDlIYUQrdE9IeVNXRHM0djlFam1KTWozV0pyaklJczR2YWV3cFBJVklJ?=
 =?utf-8?B?MHlIVFI2M3pOa0hTYmVNVStHcklGV0orZzBnSXA1Q2ZUaUVlVWpaR01tSnd2?=
 =?utf-8?B?VEhiK0dGMy9ZR1JHbTFhWGZHWHRYaWdkWS8yL1NtUXZyMmlxWjdSUkpQc1Uw?=
 =?utf-8?B?QzFsMG5adFhwS1hHL3VvVWtueTVXSWthZktNam04NTN5QSs3Nnc4Q2pqd2V4?=
 =?utf-8?B?YU1kdk1kMXZsUDRRRmhVcDZZdGxvT0xySE5wQUl6V2pYQTMxbE9ZRUdvSE1F?=
 =?utf-8?B?YWlJUFdjWVNzRkduK1NjTnRSMzhzT01pRWkyTms0WFFBTnc0RVZqREg0NTNM?=
 =?utf-8?B?UWdzWkphSUNMdE83NTNnNWRkdjVnalMvT0hrWHlObzVzUWFvZ3QxWUlYU04w?=
 =?utf-8?B?T1NCZ21rZDYzL1NpQlErcTBxWmxGR1BuS3BVRUpRbUpWc2ZmSTZkNUd4Ujcx?=
 =?utf-8?B?QnZ0UU1ycy9wTmc0d0JPZ3FiSDl3ejJDQ0s1cTdXZzZjemlhNE54Y29lZ1lj?=
 =?utf-8?B?UmpZbTVVNWJUaDArdlgxMjlxUmhFL0ZzQmdGWVBLUEhaVnFFTHFzZ3BuZnpo?=
 =?utf-8?B?NVRWcDdTUmRLcmxUcVo4K3BBSVRWOUNaMEx6c29WNXZ2Y0lQQjlNcDVma3Yw?=
 =?utf-8?B?OGE2bm0xcXA5UHM2cng5UUZza3ZnVG02U1lnbjNJNkhkNXNVTkxlMnJvc2RW?=
 =?utf-8?B?ZjhzNGlRUFBMSGlQcDdJendFL09PYTAwazdjcU1Ja2hPdDRvVklhdlhOU25h?=
 =?utf-8?B?cDFUU2x1UUFZc2V6WjltTkRid2pNQ2FSYjRxTGZoQXNEa3ROR0pSYkQwYm5x?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B26DAE6332267A4EA54F57A25D9689E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2823eb8b-3457-4a2f-7dfb-08da6afcf7d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 09:39:54.7948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4lf6mYnkZrT32+C8W1DJQL3AFoYcsvjEsYAboorMuyf4F2zxpepF4ulOo6pO3C90qeqsYNrj9fkNrU15T3u82YsaLA8wniz8VJXTcXe0R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1804
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gNy8yMS8yMiAxMjoyMywgQmlqdSBEYXMgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNv
bnRlbnQgaXMgc2FmZQ0KPiANCj4gSGkgVHVkb3IgQW1iYXJ1cywNCj4gDQo+IEkgaGF2ZSBkb25l
IHF1aWNrIHRlc3Qgd2l0aCB0aGVzZSBnZW5lcmljIHBhdGNoZXMuIFBsZWFzZSBmaW5kIG15IG9i
c2VydmF0aW9uDQo+IGJlbG93Lg0KDQpUaGFua3MhDQoNCj4gDQo+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDIvMl0gbXRkOiBzcGktbm9yOiBBZGQgUmVuZXNhcyBBVDI1UUwxMjhBIHNlcmlhbCBu
b3INCj4+IGZsYXNoDQo+Pg0KPj4gT24gNy8xNS8yMiAxMzo1NywgQmlqdSBEYXMgd3JvdGU6DQo+
Pg0KPj4gSGksIEJpanUhDQo+Pg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cNCj4+PiB0aGUgY29udGVudCBp
cyBzYWZlDQo+Pj4NCj4+PiBBZGQgc3VwcG9ydCBmb3IgUmVuZXNhcyBBVDI1UUwxMjhBIHNlcmlh
bCBub3IgZmxhc2guDQo+Pj4gRGV0YWlscyBvZiBmbGFzaCBjaGlwIGNhbiBiZSBmb3VuZCBoZXJl
IFsxXQ0KPj4+DQo+Pj4gWzFdDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+Pj4gLS0tDQo+Pj4gJCB4eGQgLXAgc2ZkcA0KPj4+
IDUzNDY0NDUwMDYwMTAxZmYwMDA2MDExMDMwMDAwMGZmMWYwMDAxMDI4MDAwMDAwMWZmZmZmZmZm
ZmZmZg0KPj4+IGZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmU1MjBmMWZmZmZm
ZmZmMDc0NGViMDg2Yg0KPj4+IDA4M2I4MGJiZmVmZmZmZmZmZmZmMDBmZmZmZmY0MmViMGMyMDBm
NTIxMGQ4MDBmZjMzNjJkNTAwODQyOQ0KPj4+IDAxY2VlY2ExMDczZDdhNzU3YTc1ZjdhMmQ1NWMx
OWY2MWNmZmU4MTBjMDgwZmZmZmZmZmZmZmZmZmZmZg0KPj4+IGZmZmZmZmZmZmZmZmZmZmY1MDE2
NTAxOTAwMDBmZmZmDQo+Pj4NCj4+PiAkIG1kNXN1bQ0KPj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9y
bS9zb2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTENCj4+PiAu
MC9zcGktbm9yL3NmZHAgMjNlM2VjNTZiNWI4Zjk4NmQwNDg4YmE0NzI3MjM5ZGQNCj4+PiAvc3lz
L2RldmljZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIv
c3BpMS9zcGkxDQo+Pj4gLjAvc3BpLW5vci9zZmRwICQgY2F0DQo+Pj4gL3N5cy9kZXZpY2VzL3Bs
YXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMQ0K
Pj4+IC4wL3NwaS1ub3IvamVkZWNfaWQNCj4+PiAxZjQyMTgNCj4+PiAkIGNhdA0KPj4+IC9zeXMv
ZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkvc3BpX21hc3Rlci9z
cGkxL3NwaTENCj4+PiAuMC9zcGktbm9yL3BhcnRuYW1lDQo+Pj4gYXQyNXFsMTI4YQ0KPj4+ICQg
Y2F0DQo+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNw
aS9zcGlfbWFzdGVyL3NwaTEvc3BpMQ0KPj4+IC4wL3NwaS1ub3IvbWFudWZhY3R1cmVyDQo+Pj4g
YXRtZWwNCj4gDQo+IFdpdGggZ2VuZXJpYyBmbGFzaCBkcml2ZXIgcGF0Y2hlcyBJIGdldCBiZWxv
dyByZXN1bHRzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gDQo+IHh4ZCAtcCBzZmRwDQo+IDUzNDY0NDUwMDYwMTAxZmYwMDA2MDExMDMw
MDAwMGZmMWYwMDAxMDI4MDAwMDAwMWZmZmZmZmZmZmZmZg0KPiBmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZlNTIwZjFmZmZmZmZmZjA3NDRlYjA4NmINCj4gMDgzYjgwYmJmZWZm
ZmZmZmZmZmYwMGZmZmZmZjQyZWIwYzIwMGY1MjEwZDgwMGZmMzM2MmQ1MDA4NDI5DQo+IDAxY2Vl
Y2ExMDczZDdhNzU3YTc1ZjdhMmQ1NWMxOWY2MWNmZmU4MTBjMDgwZmZmZmZmZmZmZmZmZmZmZg0K
PiBmZmZmZmZmZmZmZmZmZmZmNTAxNjUwMTkwMDAwZmZmZg0KPiANCj4gVGhpcyByZXN1bHQgaXMg
c2FtZSBhcyBhYm92ZS4NCg0Kb2ssIGFzIGV4cGVjdGVkLg0KDQo+IA0KPiBjYXQgL3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNwaS9zcGlfbWFzdGVyL3NwaTEv
c3BpMS4wL3NwaS1ub3IvamVkZWNfaWQNCj4gMWY0MjE4MWY0MjE4DQo+IA0KPiBUaGlzIHJlc3Vs
dCBpcyBub3QgbWF0Y2hpbmcgMWY0MjE4LT4xZjQyMTgxZjQyMTgNCg0KaGVyZSBpdCBsb29rcyBs
aWtlIHRoZSBJRCBpcyBzZW50IHR3aWNlLg0KDQo+IA0KPiByb290QHNtYXJjLXJ6ZzJ1bDp+IyBj
YXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMDA2MDAwMC5zcGkvcnBjLWlmLXNwaS9zcGlf
bWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3IvcGFydG5hbWUNCj4gc3BpLW5vci1nZW5lcmljDQo+
IA0KPiBUaGlzIHJlc3VsdCBpcyBub3QgbWF0Y2hpbmcgYXQyNXFsMTI4YS0+IHNwaS1ub3ItZ2Vu
ZXJpYw0KDQpyaWdodCwgYXMgZXhwZWN0ZWQNCg0KPiANCj4gcm9vdEBzbWFyYy1yemcydWw6fiMg
Y2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkvc3Bp
X21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL21hbnVmYWN0dXJlcg0KPiBjYXQ6IC9zeXMvZGV2
aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNjAwMDAuc3BpL3JwYy1pZi1zcGkvc3BpX21hc3Rlci9zcGkx
L3NwaTEuMC9zcGktbm9yL21hbnVmYWN0dXJlcjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0K
PiANCj4gVGhpcyByZXN1bHQgaXMgbm90IG1hdGNoaW5nIGF0bWVsLT4gY2F0OiAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jLzEwMDYwMDAwLnNwaS9ycGMtaWYtc3BpL3NwaV9tYXN0ZXIvc3BpMS9z
cGkxLjAvc3BpLW5vci9tYW51ZmFjdHVyZXI6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCg0K
aGVyZSB3ZSBjb3VsZCBpbnRyb2R1Y2UgYSBnZW5lcmljIG5hbWUgYXMgd2VsbC4NCg0KPiANCj4g
SG93IGRvIHdlIGdldCBwcm9wZXIgcGFydG5hbWUvbWFudWZhY3R1cmVyIGRldGFpbHMgd2l0aCBn
ZW5lcmljIGZsYXNoIGRyaXZlcj8NCg0KWW91IGRvbid0LCBhcyBpdCBpcyB5b3UgZ2V0IGp1c3Qg
Z2VuZXJpYyBuYW1lcyBsaWtlIGdlbmVyaWMtc3BpLW5vcg0KYW5kIGdlbmVyaWMtbWFudWZhY3R1
cmVyLiBXaHkgZG8geW91IGZpbmQgdGhlIGZsYXNoL21hbnVmYWN0dXJlcg0KbmFtZXMgaW1wb3J0
YW50Pw0KDQp0YQ0K
