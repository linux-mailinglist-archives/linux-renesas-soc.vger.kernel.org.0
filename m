Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150DB674F81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 09:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjATIbt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 03:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjATIbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 03:31:47 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851FAC14F;
        Fri, 20 Jan 2023 00:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674203505; x=1705739505;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=LM21IujlS0c7/Pqo7heL7oYgkKIPVnizW2J9FSPp0CY=;
  b=Et9lYAttHFWpqitcI1G9FG3NIWWSRFgPKydEL1G1ATy/bQ63bpqA+0eu
   bi/Z8a2d0otoeqUA+07w3t7Tzby9onf2uwxKJuCosorKjWX2mHhpTbtog
   RFnmh9SgMTiXFPmv1Cl5syGruNYiM3by6QRMhhHgEXuOBmuVkNcI3TqLU
   pttlBje9Nchges4H7i9m0M47xPbkEKpBCnYnpYhEK+WIkLX7x6Wt2521k
   RiMgU267jL2SsOseTvhXVBrZz4KrPBOsc0rT+V0UgnpWoiHs6Rza6ecox
   +rWdgL9v86YTLl2Invt/5gW6pmU5btKtz5id7DJPlgDV8gELwCZKO8QDU
   w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669100400"; 
   d="scan'208";a="133251635"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 01:31:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 01:31:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 01:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQapKJuGW9JqfHq90auZUMVRqHMdDoyoeGb6u+SHyoapXhJ90o/O0L3wv1wlg/UAo36N8X2lnPVzsOVD/qAT4pe+ksTDRrJ3TS9T3f6WPT0yzRHtWiA6gWPSgJDHv42+OesDY1PVdLWVPVZEPKyXHe37T3m/L+g0vR6k5lMlLcnnFnIhw3eNsx6TVKwVNQ9MpEs9SX6zb8G0pgFI+rAISFkjIk5tYtm2cKu/F6jccnbgmyP6JfdQHbnEGDVudwkhbpRnHhp2wiqRxoNFRaJUfTfs/gtT0rHx3MAqdH1iJyfkJ35rYpUHWftPqKAM0BhSHKwBQbby3JF5fBC55f0mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM21IujlS0c7/Pqo7heL7oYgkKIPVnizW2J9FSPp0CY=;
 b=iQCpB+M4/8PjFKHhR5Yv5SdWCv+Rvza3QtoHw94MW9yA3u+0d6yQ6UOSNY/0WVxvj5JbPnvfLOuBymUTzrniWjWLLCHmoPJdtmblqDkp43jneg5O6UvzpOTxVhQXbqfmgKIgcRlJuORF93KIj8L+nfi5uJ5qIBHVQzHO1G18GxXxJX30bqbKomi8NteA0Kn9XL5q21acrh/Rx3IfECPG6xxoEXY5OhJvfryblnYNDRMFq5zmxAY174pC2nTKjx1SOY1XLBEUfJT2eSjfU4IYt2F2M4vXkRK9P5zf+b3BM66vUNmCindgBPJvOTqyR0vJrRVHJoKVVYnX/RkeqvuooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM21IujlS0c7/Pqo7heL7oYgkKIPVnizW2J9FSPp0CY=;
 b=TmllAB5hpdpan2VyCw1gvOoEVQ5ZOZr2Rk2v4dliMdtCfafwgSzlp8zUkxr0CKysHrzG5BHUoDbMMeA4iRVi8fIPgY+fORdaS1zb6mlRJAVJv1pdpOb08UtnTU8442LSuZ2Wedq820u5Xw8V6l7rz0sqn1UALdro+g9A5itblbs=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 08:31:38 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5%9]) with mapi id 15.20.6002.026; Fri, 20 Jan 2023
 08:31:38 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <krzysztof.kozlowski@linaro.org>, <lars@metafoo.de>,
        <Michael.Hennerich@analog.com>, <jic23@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <lucas.p.stankus@gmail.com>, <puranjay12@gmail.com>,
        <ddrokosov@sberdevices.ru>, <alexandru.tachici@analog.com>,
        <marcelo.schmitt1@gmail.com>, <renatogeh@gmail.com>,
        <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ak@it-klinger.de>,
        <marcus.folkesson@gmail.com>, <kent@minoris.se>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <alim.akhtar@samsung.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux@rempel-privat.de>,
        <kernel@pengutronix.de>, <nuno.sa@analog.com>,
        <nish.malpani25@gmail.com>, <rmfrfs@gmail.com>,
        <dragos.bogdan@analog.com>, <jmaneyrol@invensense.com>,
        <lorenzo@kernel.org>, <bleung@chromium.org>, <groeck@chromium.org>,
        <stefan.popa@analog.com>, <decatf@gmail.com>, <sean@geanix.com>,
        <contact@artur-rojek.eu>, <miquel.raynal@bootlin.com>,
        <tremyfr@yahoo.fr>, <alazar@startmail.com>,
        <linus.walleij@linaro.org>, <caleb.connolly@linaro.org>,
        <fabrice.gasnier@foss.st.com>, <stefan@agner.ch>,
        <daniel.baluta@nxp.com>, <harald@ccbib.org>, <ez@norophonic.com>,
        <preid@electromag.com.au>, <matt.ranostay@konsulko.com>,
        <swboyd@chromium.org>, <navin@linumiz.com>,
        <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
Thread-Topic: [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
Thread-Index: AQHZLKmcrVXALejg/kSFjYvE1tyWYQ==
Date:   Fri, 20 Jan 2023 08:31:37 +0000
Message-ID: <1c39ee04-3568-0304-3497-95d3c7b1d16a@microchip.com>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|CH0PR11MB5252:EE_
x-ms-office365-filtering-correlation-id: 9d19417a-82ba-4ac2-a352-08dafac0bf7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GEYqskX0CuBejEF/nQRy1gfdWlUTacwVYtXKkfpeIH2dr+B5dR6KQpbwV87mi+Q22zyZTmp7kw6aBk15nj3CHWQOQa86viCd0nlTAwUJcckXq16ssSaUZgXfhVL3iY7fxQ9vTggJo1tZJ6VJu7FY+cSGu1CtailE05BK4LyczS2l7DJiAjmAVZzF0wgOj+x6SNZhFEogiuUUnOspYV08oCNLIP9uhYIVQppDcJnLivjZGUxmiR1YIp4eAAi7nOIqJHwjldICkXAlVFMudlteZYMt+yRRPd6Q83ENEJRWJjA3A31P5GsUpdH3OybwcpbuSdOU94yfgYWfa498KDGzV8bjJmt0dZwAMi9MNfmbF1kq3Bjn5BUc/uJNpukwoVz3XX9mBYVC1Z1ofWrLd+QnYw2gk3wwJ9VY9ezzG0Mg9/+ZNjxHoSeBRWGmhCUZ54/A+4BjJJm3JyAFiJJFRlPFoXoljMFSL30PXfL8GgSMOOmmfzWjhZwAxgY05yMKuDyDyxUpf8QrnigVCE0rCACj044y7yvbpmMtr9QUCzslh3FZxWPxawTm5/x3azHSbSRM0i3ydhmTEJKdXl49N6zk3uIr0wwULu8rU6nYWhj7O3HEd7wybov2dtmvHCiJEVqxsDRorwyRrdSjRKeBw2jvaWQ5IUgZP3nyB9QHu3KWKbnwB7nys3Zx1Fu5jNSUjSxeLAq0v21U+f2wyKiUmbhCIgRCIuJPJptaOnqiLzjKrqY+q4oP74MuK+eEaH2SKK3Db5b6wRaGzB4Wugwi72dFIflhWPhZKOAUheU4u++LWaJWBlO50nF9LFKgMQpKZVuIBlOsK2GjpkmUwSYX9y+LQXztxXXCrn7t1kA8cTZZiiY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(26005)(2906002)(186003)(6512007)(110136005)(6506007)(53546011)(316002)(2616005)(1191002)(966005)(6486002)(36756003)(478600001)(71200400001)(122000001)(31696002)(38100700002)(86362001)(38070700005)(921005)(83380400001)(41300700001)(7366002)(7406005)(7416002)(5660300002)(30864003)(31686004)(8936002)(91956017)(76116006)(66946007)(66556008)(66446008)(66476007)(8676002)(64756008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjRicm42ZC9UYnl6VFVxS1ROcUQ3eDNoeWYxSkRHOStneWV0c2tNNXIzWjJj?=
 =?utf-8?B?eDFjVngzMWxxMld4Q0FDb2E2MnpqOFRRY3lQK0Jlbk93ZFFZdG1zVGh3M0Qx?=
 =?utf-8?B?RW05U3RuWjg3aFNLMGRXWit5dDRHUVdiY3hSUG1HZEIySHUyYTE1MmUzZ2hp?=
 =?utf-8?B?VEtGNjhON0N5aG9Xd1ozOUV2VnZPNU9TVy9OTGxSWUdNSzFCdld1VHNKUXJG?=
 =?utf-8?B?bDB0ZDdEQXVIa1Q4SGdCMzZKeENaZTJsOEFDTDNKMWd0TUZzSXJBS1E2V0E0?=
 =?utf-8?B?VEVpQVZwTGMwQ0kyUEVZcm5uZzFYR2VnN1M5Q0dIYnJSM1VwQXM2MG56dlox?=
 =?utf-8?B?VFh5MkpKMG5BbWpFdmRPOFUrc2xwbFNxMWM3NEFOQ3dVdEl1Z08zZDRVT0oy?=
 =?utf-8?B?M2FyOUM1SnpNRGVrQm1ySHEwOU9UN2ZjMjh1a1M2NFdobFhsZE1PRlU0SU1l?=
 =?utf-8?B?bzdOa3hrOEk2OHRKNm1jNHJzbkVnYTgrTEVYS2lVOFRtY2JmNklnaDZtZ0NP?=
 =?utf-8?B?WkI2Z3c1WUdUWGdXRzU3N2d6MWJTRmlobkZHY2U5bFB3NnloSWEzV2ZBSHRK?=
 =?utf-8?B?eDNETDhseGZTRWpCVkVHZk55clNyU2ZzQndxRWFUTUVXNnBLTENxL2xpU1FH?=
 =?utf-8?B?RWNUZm8wamZmZ0hHUy9IV3BLdmNETEcvZG0rWmk2dEZyeFBuYktidWJYdC9K?=
 =?utf-8?B?Y0VFbVFJMzNuYUlYNTdmZmNmWU4vV2ZITHRoNFFHT0NnS2ErVVJoaWY4M0NS?=
 =?utf-8?B?RGx4NjE0enppZUdoRnZNM1FMZ1ZTTU5ZdEwxdWsyUFVEaVFhWlRDSEt2WlZh?=
 =?utf-8?B?eHF3a1lFN0h3SlVpVmYzaVVHUFhMMHo4RHczL0wvOFJpd294R0V6anpwNFFr?=
 =?utf-8?B?aDcrUzFydk13K0laOWdnSlhHSjBrOUpqaUNTWUdZb041N2hiYVFRa2tsODhJ?=
 =?utf-8?B?MlhQMTZ3UXJOMitKd2MxU3ZuTk9WcDlvbjZKeXRqZGlTT0I4YUZtOTBDenJO?=
 =?utf-8?B?eFJLODlybU9Bcnh2V1Yrbk90M3M2ZmREd3d0azhlVnVKa09SN0NoR0RqaU0y?=
 =?utf-8?B?cmNqV2VsL0xtVzZ0K3U0MENmKzd4N1NBNldGUXhZclVtdUNEbXQrNFJ1eVlV?=
 =?utf-8?B?UDZLRjlUaGlndmN6N2ZhdDd2a2NxcmdLRHI2TytYYzlkR3BSQ2tXRHhERFBj?=
 =?utf-8?B?czhuSXhlOFRiem4vTVc2S3kvQTI2RDMvRi91OW1USmRZK3hhQWo1bXl6dXds?=
 =?utf-8?B?LzFGYkg1SGZjRVZrYWJDdUlqdHQ1dW1Kd24zdnk1MS8zMTVvU0pYZE1KMng1?=
 =?utf-8?B?cnU0UHFDc21CdEZyaG9NOUM5Y2QyTmcra0pKem1DNzBZVzFZWSs1cExIOFo2?=
 =?utf-8?B?UUVGWFBEWW9MdDNSWVpZbXBMZFptZmcrVkljUk5wOW9INVMrZDUxS0NmYU5R?=
 =?utf-8?B?UGVWMTN3Qi83WVpDZ04yS25rQzZrOXA5WUMyWDJEdnJrMCtPeStKallvZFZR?=
 =?utf-8?B?Zit4WUx4d3drK2Qrc0NiWjExVnFnUERuWm4vT0dDVjJRbStUa1NHSHJJZzBM?=
 =?utf-8?B?RDRDTHd1Wm83T1dqdzYwWkUrNWtwRnRJSGtuZ1FqL01ublRrdWpHeTlTdFUr?=
 =?utf-8?B?bmFsQ2swN24zMEpUcWI0a3NNdWtwZDdpVlIxQlNFVytYT3Btb3lDeVRLWm9l?=
 =?utf-8?B?clRaRW1DNzNjSHRBMkxCNG5VV0FNd29wLytyUEFCTm81cEY0by9jUmpzTllH?=
 =?utf-8?B?Q0RRQ0Z3MTZ3Q2NQMlp1SUtYcWtiTUtubG5yOWhnRk1aenlld0V2amE2bnlI?=
 =?utf-8?B?cHlIbU9saStDZlAwVlVLN2RmOUU2R0RXTWxsU1VjTkVJWitEZUxnSU9PSlJF?=
 =?utf-8?B?YzBJQ3RNdC9Fc2xPWmV5SVMzeUk2MGNqdEdERU1GRnJnYXNsaTNTMkxuWXVM?=
 =?utf-8?B?eTYwMnhnbkt0TmR4SEZyTjN0bHFuV2RucVRNVmJDaThaR010Sk5SRlNqWlFn?=
 =?utf-8?B?OGJGaEM0ZjFUai8xbTdkWDgrNC83eUtSZk9Cd3kwWHdrOHlON3N6Ui9VU0k2?=
 =?utf-8?B?eTRZdEV4NGJzTHRKbkVnOGp6UDg2cE95NVFGSHlqNk1sTThRUXpxTDd6MVVN?=
 =?utf-8?B?WGRkbm9EN2F3aDY3dmJMdEZ1blZaaGdkR3dkSkRFU2ZIOG8wVGVMam5mdHUy?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24EF58E3628B804F8F04ABAC4CA07EA4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d19417a-82ba-4ac2-a352-08dafac0bf7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 08:31:37.9355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzHgcZI2fKWA3D469s/+ECqgexWonyCbU2u0Hp9yfiBlHF/8l/yQ6DonGb/19VnbONkJU3zRiVksHRUe41ADLkbmxaJaxqnRfjTbp48JtB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gMTguMDEuMjAyMyAyMDo0NCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBDbGVhbnVwIGJ5IHJlbW92aW5nIHVu
bmVlZGVkIHF1b3RlcyBmcm9tIHJlZnMgYW5kIHJlZHVuZGFudCBibGFuayBsaW5lcy4NCj4gTm8g
ZnVuY3Rpb25hbCBpbXBhY3QgZXhjZXB0IGFkanVzdGluZyB0byBwcmVmZXJyZWQgY29kaW5nIHN0
eWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lpby9hY2NlbC9tZW1zZW5zaW5nLG1zYTMxMS55YW1sICB8IDUgKystLS0NCj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FkaSxhZDcxMjQueWFtbCB8IDIgKy0N
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FkaSxhZDcyOTIu
eWFtbCB8IDIgKy0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYXRtZWwsc2Ft
YTVkMi1hZGMueWFtbCAgICB8IDIgKy0NCg0KRm9yIGF0bWVsLHNhbWE1ZDItYWRjLnlhbWw6DQpS
ZXZpZXdlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+
DQoNCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2F2aWEtaHg3
MTEueWFtbCB8IDQgKystLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9pbmdl
bmljLGFkYy55YW1sICAgICAgICAgIHwgNCArKy0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9paW8vYWRjL21pY3JvY2hpcCxtY3AzOTExLnlhbWwgICAgfCA0ICsrLS0NCj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvcmVuZXNhcyxyemcybC1hZGMueWFtbCAgICB8IDIgKy0N
Cj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvc2Ftc3VuZyxleHlub3MtYWRjLnlh
bWwgICB8IDIgKy0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvc3Qsc3RtMzIt
YWRjLnlhbWwgICAgICAgICB8IDggKysrKy0tLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lpby9hZGMvdGksYWRzMTMxZTA4LnlhbWwgICAgICAgICB8IDIgKy0NCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3RpLHRzYzIwNDYueWFtbCB8IDIgKy0NCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9kYWMvbGx0YyxsdGMxNjYwLnlhbWwgICAgICAg
ICB8IDQgKystLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2RhYy9sbHRjLGx0YzI2
MzIueWFtbCAgICAgICAgIHwgNCArKy0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8v
ZGFjL3N0LHN0bTMyLWRhYy55YW1sICAgICAgICAgfCA0ICsrLS0NCj4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vaW11L3N0LGxzbTZkc3gueWFtbCB8IDIgKy0NCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby90ZW1wZXJhdHVyZS90aSx0bXAxMTcueWFtbCAgICB8
IDYgKysrLS0tDQo+ICAxNyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzMCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaWlvL2FjY2VsL21lbXNlbnNpbmcsbXNhMzExLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaWlvL2FjY2VsL21lbXNlbnNpbmcsbXNhMzExLnlhbWwNCj4gaW5k
ZXggMjM1MjhkY2FhMDczLi5kNTMwZWMwNDFmZTcgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWNjZWwvbWVtc2Vuc2luZyxtc2EzMTEueWFtbA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FjY2VsL21lbXNl
bnNpbmcsbXNhMzExLnlhbWwNCj4gQEAgLTEsOSArMSw4IEBADQo+ICAjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlDQo+IC0NCj4gICVZQU1MIDEu
Mg0KPiAgLS0tDQo+IC0kaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vYWNj
ZWwvbWVtc2Vuc2luZyxtc2EzMTEueWFtbCMiDQo+IC0kc2NoZW1hOiAiaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIg0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9paW8vYWNjZWwvbWVtc2Vuc2luZyxtc2EzMTEueWFtbCMNCj4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiANCj4g
IHRpdGxlOiBNRU1TZW5zaW5nIGRpZ2l0YWwgMy1BeGlzIGFjY2VsZXJvbWV0ZXINCj4gDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hZGks
YWQ3MTI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9h
ZGksYWQ3MTI0LnlhbWwNCj4gaW5kZXggNzVhNzE4NGE0NzM1Li4zNWVkMDQzNTBlMjggMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FkaSxh
ZDcxMjQueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlv
L2FkYy9hZGksYWQ3MTI0LnlhbWwNCj4gQEAgLTYxLDcgKzYxLDcgQEAgcmVxdWlyZWQ6DQo+IA0K
PiAgcGF0dGVyblByb3BlcnRpZXM6DQo+ICAgICJeY2hhbm5lbEAoWzAtOV18MVswLTVdKSQiOg0K
PiAtICAgICRyZWY6ICJhZGMueWFtbCINCj4gKyAgICAkcmVmOiBhZGMueWFtbA0KPiAgICAgIHR5
cGU6IG9iamVjdA0KPiAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICAgICAgICBSZXByZXNlbnRzIHRo
ZSBleHRlcm5hbCBjaGFubmVscyB3aGljaCBhcmUgY29ubmVjdGVkIHRvIHRoZSBBREMuDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hZGks
YWQ3MjkyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9h
ZGksYWQ3MjkyLnlhbWwNCj4gaW5kZXggMWJmYmVlZDZmMjk5Li43Y2M0ZGRjNGU5YjcgMTAwNjQ0
DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FkaSxh
ZDcyOTIueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlv
L2FkYy9hZGksYWQ3MjkyLnlhbWwNCj4gQEAgLTQzLDcgKzQzLDcgQEAgcmVxdWlyZWQ6DQo+IA0K
PiAgcGF0dGVyblByb3BlcnRpZXM6DQo+ICAgICJeY2hhbm5lbEBbMC03XSQiOg0KPiAtICAgICRy
ZWY6ICJhZGMueWFtbCINCj4gKyAgICAkcmVmOiBhZGMueWFtbA0KPiAgICAgIHR5cGU6IG9iamVj
dA0KPiAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICAgICAgICBSZXByZXNlbnRzIHRoZSBleHRlcm5h
bCBjaGFubmVscyB3aGljaCBhcmUgY29ubmVjdGVkIHRvIHRoZSBBREMuDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hdG1lbCxzYW1hNWQy
LWFkYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYXRt
ZWwsc2FtYTVkMi1hZGMueWFtbA0KPiBpbmRleCAzMWY4NDBkNTkzMDMuLjQ4MTdiODQwOTc3YSAx
MDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMv
YXRtZWwsc2FtYTVkMi1hZGMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaWlvL2FkYy9hdG1lbCxzYW1hNWQyLWFkYy55YW1sDQo+IEBAIC00MSw3ICs0MSw3
IEBAIHByb3BlcnRpZXM6DQo+ICAgICAgZGVzY3JpcHRpb246IFN0YXJ0dXAgdGltZSBleHByZXNz
ZWQgaW4gbXMsIGl0IGRlcGVuZHMgb24gU29DLg0KPiANCj4gICAgYXRtZWwsdHJpZ2dlci1lZGdl
LXR5cGU6DQo+IC0gICAgJHJlZjogJy9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMicNCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzINCj4gICAgICBkZXNjcmlwdGlvbjoNCj4gICAgICAgIE9uZSBvZiBwb3NzaWJsZSBlZGdlIHR5
cGVzIGZvciB0aGUgQURUUkcgaGFyZHdhcmUgdHJpZ2dlciBwaW4uDQo+ICAgICAgICBXaGVuIHRo
ZSBzcGVjaWZpYyBlZGdlIHR5cGUgaXMgZGV0ZWN0ZWQsIHRoZSBjb252ZXJzaW9uIHdpbGwNCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2F2
aWEtaHg3MTEueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRj
L2F2aWEtaHg3MTEueWFtbA0KPiBpbmRleCA3NzYwNWYxNzkwMWMuLjljNTdlYjEzZjg5MiAxMDA2
NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYXZp
YS1oeDcxMS55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
aW8vYWRjL2F2aWEtaHg3MTEueWFtbA0KPiBAQCAtMSw4ICsxLDggQEANCj4gICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gICVZQU1MIDEuMg0KPiAgLS0tDQo+IC0kaWQ6ICJo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vYWRjL2F2aWEtaHg3MTEueWFtbCMiDQo+
IC0kc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Ig0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vYWRjL2F2aWEtaHg3
MTEueWFtbCMNCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIw0KPiANCj4gIHRpdGxlOiBBVklBIEhYNzExIEFEQyBjaGlwIGZvciB3ZWlnaHQg
Y2VsbHMNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaWlvL2FkYy9pbmdlbmljLGFkYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lpby9hZGMvaW5nZW5pYyxhZGMueWFtbA0KPiBpbmRleCA1MTdlOGIxZmNiNzMuLmI3
MWM5NTFlNmQwMiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2lpby9hZGMvaW5nZW5pYyxhZGMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9pbmdlbmljLGFkYy55YW1sDQo+IEBAIC0yLDggKzIsOCBA
QA0KPiAgIyBDb3B5cmlnaHQgMjAxOS0yMDIwIEFydHVyIFJvamVrDQo+ICAlWUFNTCAxLjINCj4g
IC0tLQ0KPiAtJGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaWlvL2FkYy9pbmdl
bmljLGFkYy55YW1sIyINCj4gLSRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMiDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L2lpby9hZGMvaW5nZW5pYyxhZGMueWFtbCMNCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiANCj4gIHRpdGxlOiBJbmdlbmljIEpaNDd4
eCBBREMgY29udHJvbGxlciBJSU8NCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9taWNyb2NoaXAsbWNwMzkxMS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvbWljcm9jaGlwLG1jcDM5MTEueWFt
bA0KPiBpbmRleCAyYzkzZmI0MWYxNzIuLmY3YjNmZGU0MTE1YSAxMDA2NDQNCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvbWljcm9jaGlwLG1jcDM5MTEu
eWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9t
aWNyb2NoaXAsbWNwMzkxMS55YW1sDQo+IEBAIC0yLDggKzIsOCBAQA0KPiAgIyBDb3B5cmlnaHQg
MjAxOSBNYXJjdXMgRm9sa2Vzc29uIDxtYXJjdXMuZm9sa2Vzc29uQGdtYWlsLmNvbT4NCj4gICVZ
QU1MIDEuMg0KPiAgLS0tDQo+IC0kaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9p
aW8vYWRjL21pY3JvY2hpcCxtY3AzOTExLnlhbWwjIg0KPiAtJHNjaGVtYTogImh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyINCj4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvaWlvL2FkYy9taWNyb2NoaXAsbWNwMzkxMS55YW1sIw0KPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+IA0K
PiAgdGl0bGU6IE1pY3JvY2hpcCBNQ1AzOTExIER1YWwgY2hhbm5lbCBhbmFsb2cgZnJvbnQgZW5k
IChBREMpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2lpby9hZGMvcmVuZXNhcyxyemcybC1hZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9paW8vYWRjL3JlbmVzYXMscnpnMmwtYWRjLnlhbWwNCj4gaW5kZXggOGI3
NDM3NDJhNWY5Li5iYTg2YzdiN2Q2MjIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3JlbmVzYXMscnpnMmwtYWRjLnlhbWwNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvcmVuZXNhcyxyemcybC1h
ZGMueWFtbA0KPiBAQCAtNjksNyArNjksNyBAQCByZXF1aXJlZDoNCj4gDQo+ICBwYXR0ZXJuUHJv
cGVydGllczoNCj4gICAgIl5jaGFubmVsQFswLTddJCI6DQo+IC0gICAgJHJlZjogImFkYy55YW1s
Ig0KPiArICAgICRyZWY6IGFkYy55YW1sDQo+ICAgICAgdHlwZTogb2JqZWN0DQo+ICAgICAgZGVz
Y3JpcHRpb246IHwNCj4gICAgICAgIFJlcHJlc2VudHMgdGhlIGV4dGVybmFsIGNoYW5uZWxzIHdo
aWNoIGFyZSBjb25uZWN0ZWQgdG8gdGhlIEFEQy4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3NhbXN1bmcsZXh5bm9zLWFkYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvc2Ftc3VuZyxleHlub3Mt
YWRjLnlhbWwNCj4gaW5kZXggODFjODcyOTU5MTJjLi5lMjdkMDk0Y2ZhMDUgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3NhbXN1bmcsZXh5
bm9zLWFkYy55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
aW8vYWRjL3NhbXN1bmcsZXh5bm9zLWFkYy55YW1sDQo+IEBAIC01Miw3ICs1Miw3IEBAIHByb3Bl
cnRpZXM6DQo+ICAgIHZkZC1zdXBwbHk6IHRydWUNCj4gDQo+ICAgIHNhbXN1bmcsc3lzY29uLXBo
YW5kbGU6DQo+IC0gICAgJHJlZjogJy9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUnDQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhh
bmRsZQ0KPiAgICAgIGRlc2NyaXB0aW9uOg0KPiAgICAgICAgUGhhbmRsZSB0byB0aGUgUE1VIHN5
c3RlbSBjb250cm9sbGVyIG5vZGUgKHRvIGFjY2VzcyB0aGUgQURDX1BIWQ0KPiAgICAgICAgcmVn
aXN0ZXIgb24gRXh5bm9zMzI1MC80eDEyLzUyNTAvNTQyMC81ODAwKS4NCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3N0LHN0bTMyLWFkYy55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvc3Qsc3RtMzIt
YWRjLnlhbWwNCj4gaW5kZXggMWMzNDBjOTVkZjE2Li45OTVjYmY4Y2VmYzYgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3N0LHN0bTMyLWFk
Yy55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRj
L3N0LHN0bTMyLWFkYy55YW1sDQo+IEBAIC0xLDggKzEsOCBAQA0KPiAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KPiAgJVlBTUwgMS4yDQo+ICAt
LS0NCj4gLSRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby9hZGMvc3Qsc3Rt
MzItYWRjLnlhbWwjIg0KPiAtJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIyINCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
aWlvL2FkYy9zdCxzdG0zMi1hZGMueWFtbCMNCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiANCj4gIHRpdGxlOiBTVE1pY3JvZWxlY3Ry
b25pY3MgU1RNMzIgQURDDQo+IA0KPiBAQCAtODAsNyArODAsNyBAQCBwcm9wZXJ0aWVzOg0KPiAg
ICAgIGRlc2NyaXB0aW9uOg0KPiAgICAgICAgUGhhbmRsZSB0byBzeXN0ZW0gY29uZmlndXJhdGlv
biBjb250cm9sbGVyLiBJdCBjYW4gYmUgdXNlZCB0byBjb250cm9sIHRoZQ0KPiAgICAgICAgYW5h
bG9nIGNpcmN1aXRyeSBvbiBzdG0zMm1wMS4NCj4gLSAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheSINCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlLWFycmF5DQo+IA0KPiAgICBpbnRlcnJ1cHQt
Y29udHJvbGxlcjogdHJ1ZQ0KPiANCj4gQEAgLTM0MSw3ICszNDEsNyBAQCBwYXR0ZXJuUHJvcGVy
dGllczoNCj4gICAgICBwYXR0ZXJuUHJvcGVydGllczoNCj4gICAgICAgICJeY2hhbm5lbEAoWzAt
OV18MVswLTldKSQiOg0KPiAgICAgICAgICB0eXBlOiBvYmplY3QNCj4gLSAgICAgICAgJHJlZjog
ImFkYy55YW1sIg0KPiArICAgICAgICAkcmVmOiBhZGMueWFtbA0KPiAgICAgICAgICBkZXNjcmlw
dGlvbjogUmVwcmVzZW50cyB0aGUgZXh0ZXJuYWwgY2hhbm5lbHMgd2hpY2ggYXJlIGNvbm5lY3Rl
ZCB0byB0aGUgQURDLg0KPiANCj4gICAgICAgICAgcHJvcGVydGllczoNCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3RpLGFkczEzMWUwOC55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvdGksYWRzMTMx
ZTA4LnlhbWwNCj4gaW5kZXggNTVjMmM3MzYyNmY0Li44OTBmMTI1ZDQyMmMgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3RpLGFkczEzMWUw
OC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRj
L3RpLGFkczEzMWUwOC55YW1sDQo+IEBAIC03Nyw3ICs3Nyw3IEBAIHJlcXVpcmVkOg0KPiANCj4g
IHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiAgICAiXmNoYW5uZWxAKFswLTddKSQiOg0KPiAtICAgICRy
ZWY6ICJhZGMueWFtbCINCj4gKyAgICAkcmVmOiBhZGMueWFtbA0KPiAgICAgIHR5cGU6IG9iamVj
dA0KPiAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ICAgICAgICBSZXByZXNlbnRzIHRoZSBleHRlcm5h
bCBjaGFubmVscyB3aGljaCBhcmUgY29ubmVjdGVkIHRvIHRoZSBBREMuDQo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy90aSx0c2MyMDQ2Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy90aSx0c2MyMDQ2
LnlhbWwNCj4gaW5kZXggYmRmM2JiYTJkNzUwLi4zMmM1MmY5ZmUxOGIgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL3RpLHRzYzIwNDYueWFt
bA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy90aSx0
c2MyMDQ2LnlhbWwNCj4gQEAgLTQxLDcgKzQxLDcgQEAgcmVxdWlyZWQ6DQo+IA0KPiAgcGF0dGVy
blByb3BlcnRpZXM6DQo+ICAgICJeY2hhbm5lbEBbMC03XSQiOg0KPiAtICAgICRyZWY6ICJhZGMu
eWFtbCINCj4gKyAgICAkcmVmOiBhZGMueWFtbA0KPiAgICAgIHR5cGU6IG9iamVjdA0KPiANCj4g
ICAgICBwcm9wZXJ0aWVzOg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lpby9kYWMvbGx0YyxsdGMxNjYwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaWlvL2RhYy9sbHRjLGx0YzE2NjAueWFtbA0KPiBpbmRleCAxMzNiMGY4
Njc5OTIuLmM5ZjUxZDAwZmE4ZiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lpby9kYWMvbGx0YyxsdGMxNjYwLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9kYWMvbGx0YyxsdGMxNjYwLnlhbWwNCj4gQEAg
LTIsOCArMiw4IEBADQo+ICAjIENvcHlyaWdodCAyMDE5IE1hcmN1cyBGb2xrZXNzb24gPG1hcmN1
cy5mb2xrZXNzb25AZ21haWwuY29tPg0KPiAgJVlBTUwgMS4yDQo+ICAtLS0NCj4gLSRpZDogImh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby9kYWMvbGx0YyxsdGMxNjYwLnlhbWwjIg0K
PiAtJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
IyINCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaWlvL2RhYy9sbHRjLGx0
YzE2NjAueWFtbCMNCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIw0KPiANCj4gIHRpdGxlOiBMaW5lYXIgVGVjaG5vbG9neSBNaWNyb3Bvd2Vy
IG9jdGFsIDgtQml0IGFuZCAxMC1CaXQgREFDcw0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vZGFjL2xsdGMsbHRjMjYzMi55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9kYWMvbGx0YyxsdGMyNjMyLnlhbWwN
Cj4gaW5kZXggYjFlYjc3MzM1ZDA1Li5jOWUzYmUzYjU3NTQgMTAwNjQ0DQo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vZGFjL2xsdGMsbHRjMjYzMi55YW1sDQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vZGFjL2xsdGMsbHRj
MjYzMi55YW1sDQo+IEBAIC0xLDggKzEsOCBAQA0KPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UNCj4gICVZQU1MIDEuMg0KPiAgLS0tDQo+IC0kaWQ6
ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vZGFjL2xsdGMsbHRjMjYzMi55YW1s
IyINCj4gLSRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMiDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby9kYWMvbGx0
YyxsdGMyNjMyLnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMNCj4gDQo+ICB0aXRsZTogTGluZWFyIFRlY2hub2xvZ3kgTFRDMjYz
eCAxMi0vMTAtLzgtQml0IFJhaWwtdG8tUmFpbCBEQUMNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2RhYy9zdCxzdG0zMi1kYWMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vZGFjL3N0LHN0bTMyLWRhYy55
YW1sDQo+IGluZGV4IDBmMWJmMTExMDEyMi4uMDQwNDViOTMyYmQyIDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2RhYy9zdCxzdG0zMi1kYWMueWFt
bA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2RhYy9zdCxz
dG0zMi1kYWMueWFtbA0KPiBAQCAtMSw4ICsxLDggQEANCj4gICMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gICVZQU1MIDEuMg0KPiAgLS0tDQo+
IC0kaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vZGFjL3N0LHN0bTMyLWRh
Yy55YW1sIyINCj4gLSRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMiDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby9k
YWMvc3Qsc3RtMzItZGFjLnlhbWwjDQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gDQo+ICB0aXRsZTogU1RNaWNyb2VsZWN0cm9uaWNz
IFNUTTMyIERBQw0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9paW8vaW11L3N0LGxzbTZkc3gueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9paW8vaW11L3N0LGxzbTZkc3gueWFtbA0KPiBpbmRleCA2OGI0ODFjNjMzMTgu
LmRlY2YwMjIzMzVkOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lpby9pbXUvc3QsbHNtNmRzeC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9paW8vaW11L3N0LGxzbTZkc3gueWFtbA0KPiBAQCAtNjMsNyArNjMs
NyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgIGRlc2NyaXB0aW9uOiBpZiBkZWZpbmVkIHByb3ZpZGVz
IFZERCBJTyBwb3dlciB0byB0aGUgc2Vuc29yLg0KPiANCj4gICAgc3QsZHJkeS1pbnQtcGluOg0K
PiAtICAgICRyZWY6ICcvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzInDQo+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ICAg
ICAgZGVzY3JpcHRpb246IHwNCj4gICAgICAgIFRoZSBwaW4gb24gdGhlIHBhY2thZ2UgdGhhdCB3
aWxsIGJlIHVzZWQgdG8gc2lnbmFsIGRhdGEgcmVhZHkNCj4gICAgICBlbnVtOg0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby90ZW1wZXJhdHVyZS90
aSx0bXAxMTcueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vdGVt
cGVyYXR1cmUvdGksdG1wMTE3LnlhbWwNCj4gaW5kZXggMzQ3YmMxNmE0NjcxLi5jNGYxYzY5Zjkz
MzAgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8v
dGVtcGVyYXR1cmUvdGksdG1wMTE3LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lpby90ZW1wZXJhdHVyZS90aSx0bXAxMTcueWFtbA0KPiBAQCAtMSwxMCAr
MSwxMCBAQA0KPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpDQo+ICAlWUFNTCAxLjINCj4gIC0tLQ0KPiAtJGlkOiAiaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvaWlvL3RlbXBlcmF0dXJlL3RpLHRtcDExNy55YW1sIyINCj4gLSRz
Y2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiDQo+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby90ZW1wZXJhdHVyZS90aSx0
bXAxMTcueWFtbCMNCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIw0KPiANCj4gLXRpdGxlOiAiVEkgVE1QMTE3IC0gRGlnaXRhbCB0ZW1wZXJh
dHVyZSBzZW5zb3Igd2l0aCBpbnRlZ3JhdGVkIE5WIG1lbW9yeSINCj4gK3RpdGxlOiBUSSBUTVAx
MTcgLSBEaWdpdGFsIHRlbXBlcmF0dXJlIHNlbnNvciB3aXRoIGludGVncmF0ZWQgTlYgbWVtb3J5
DQo+IA0KPiAgZGVzY3JpcHRpb246IHwNCj4gICAgICBUSSBUTVAxMTcgLSBEaWdpdGFsIHRlbXBl
cmF0dXJlIHNlbnNvciB3aXRoIGludGVncmF0ZWQgTlYgbWVtb3J5IHRoYXQgc3VwcG9ydHMNCj4g
LS0NCj4gMi4zNC4xDQo+IA0KDQo=
