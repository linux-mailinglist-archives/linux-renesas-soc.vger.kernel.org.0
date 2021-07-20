Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825263CFFD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 18:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhGTQRo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 12:17:44 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:62016
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229655AbhGTQRl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 12:17:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzzEhxgQzn6IJHepNLtXyWbTMz4Axv248SUpBe4La3YqVkjGjESlGa7OK82OZzpaoPRAYkjlDKd5SV6FlB21fPhb+ufMIiRFlqrXKji9IFYeZxIYqCguNUNQKCKfPc0uA/mhdpscGTkca8d1yS00fmDGH7F0CStxvsH59AOFtI+Z7XwVL3EED6/S/ziRmqJhWiqsg5cRZKsCTW8tPJ+OnUvtunhlQ/C7jmEnKaQiB+qZ90S23DRrs7yZObvVKx48W9GXiGMCZK0Xzr1qDrT98WmXmE58R9421sk5MC96HqQyjnLgnn5mbu6OG9JVujagCAYMnMLZob8bUUzVuiGvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFIRXJlc0Wec6Q+456bMLlma9VoypRBv9n99E1BkId8=;
 b=OuDhbpRQt+u3fuIbFauTHIVIAm9uZsf27nCuOWCshPH9beQqTln8+M6Weg2ip2/XCBfkPz+W8HZHXvxheWztpI8XJcaprHQ9PZW6v5hfRbMxAARa7GsPP55KoztwONItJykImw2iat8Hk3LE8J44P8Wo/TjoJtEXyQaxQRs54rD+EpUL1NUp3jRm4zLAgCglGIiN0Mr64C6w+6/zBrw+rU/be27PQvgNbRPM4rBh7m1ZRAyFcXxPupMI2hMBTYjF8Opgxz6bnuOHzpSM1jInMf/7bQ5TnFPNZo9igFSdaJcKvHO0T5+4GEMde5lK4cukeJh5btYFjZ+na5hNMBy0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFIRXJlc0Wec6Q+456bMLlma9VoypRBv9n99E1BkId8=;
 b=V27H3Rdkv/2I0hiwprCH4EcJN7/E4i79gouojgiPrDcdVtao1i/2s+X9FjZROrf2ksKsXG4v1RybY1z6QGzkPVJ3w4LXGh+kmz7A84R0DxB1Qi4oH5srBkN4/9nyF/KjyJUeY2GX+3dXMSbYdZ1RJpp734yPpBDuf0zxLtxj3ao=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 16:58:17 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:58:17 +0000
Subject: Re: [PATCH v5 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Rob Herring <robh@kernel.org>
Cc:     robh+dt@kernel.org, geert+renesas@glider.be,
        mturquette@baylibre.com, linux-renesas-soc@vger.kernel.org,
        david.cater.jc@renesas.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        michal.simek@xilinx.com, linux-clk@vger.kernel.org
References: <20210719182001.1573-1-alexander.helms.jy@renesas.com>
 <20210719182001.1573-2-alexander.helms.jy@renesas.com>
 <20210719224804.GA2768983@robh.at.kernel.org>
In-Reply-To: <20210719224804.GA2768983@robh.at.kernel.org>
From:   Alex Helms <alexander.helms.jy@renesas.com>
Message-ID: <6fbb307e-8835-224e-7912-2b956985a713@renesas.com>
Date:   Tue, 20 Jul 2021 09:58:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [132.158.153.82] (68.225.135.226) by SJ0PR05CA0164.namprd05.prod.outlook.com (2603:10b6:a03:339::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend Transport; Tue, 20 Jul 2021 16:58:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6276ade4-c9d8-43c3-d3b8-08d94b9f91ce
X-MS-TrafficTypeDiagnostic: OS3PR01MB5959:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS3PR01MB59592697431E90D024EA09FAC8E29@OS3PR01MB5959.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqbfwUQG4AMGa1iU1AGzdZSJABcPr3Gn4m7eZjULUKdIOWckD3DoKF3ohveU9/W9BdX+SJ4x6WfWAI3vay0irKtiEIIbELXyW/tKLKxfOatrgj9aObDXDWyUtsSNc35Q0nAo8buwDXzUZNS0KEaz4Fv1cLvAWuplnkfQDl0N0VbDk2HCBqqGVhCpADMpYG7INwY7APhXCLacLEXdtuypnUxB94OUz8p0fXoZyuLnc35R8alPXkwA22+to4yMchX25eTfVPSOm8X+ebcz/tZzvxQuAhaL+ecgsziVPU6x+op1c+9Gxw39UNIWIOEnv90AhCSUTWzLXrzJiLDQlC8QWE/dVsl9BJ6VE+vKoXwswbo/Ljpz6vMQ7AqdGUu8D8ePpVWdVkVr+V5r+ILtiUFwGsgSqHaYIYwjQJi4Hok5SKE1GqMLMF1q/eFFIiPjWpdsLhCgeeRDagnB/UGN/cyF602mTKeMIDX58Degu7SCTcroXDp2YlByv7uwk6zz+hqhEzyDAhC07Idgyn19FeO7PHAtckTozxdTnmg3Ogoh2IVq0+/9UQpdXTryhlL1gmiOjKCGLt6bLzWVhxTpRJBKDg2P9xf0UW/AEDict+zf4NmiVr+YF2VuMzzS6vKtFKohAjaERxDMOfav/gJXZTszegt5h7GH38eXYPXl7FSNBgfhQoyvmYpw/e57hRtJfp63EQA8n+W0ZArBsnpZidgSB/2boepEYwxRdJGz8hTTE23pwp8LdXmIwOlfAHZ+OoYOFMsHc/KICA/Kn9PhO5TUSbEFanx0+z16/lIrnTMsRqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(186003)(31696002)(52116002)(4326008)(6486002)(31686004)(53546011)(2906002)(38100700002)(83380400001)(86362001)(38350700002)(316002)(956004)(26005)(2616005)(5660300002)(8936002)(6706004)(66556008)(66476007)(6916009)(8676002)(36756003)(508600001)(6666004)(16576012)(66946007)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhoOHNwSzZRWkZ2SGVxNzBoZ0xGSDZmRWlCQjk4Z1kraWE4ZnFhemdSVDlY?=
 =?utf-8?B?RmNXYUlRdzg1TGFhOHdSSW1jZ1lOcFNKTzNnNVF2Mk9DVTdGVG9wRitsSkF1?=
 =?utf-8?B?Zm5QWFZTWEoxNWJYS0NVbXUvU0pCUW1lZ0dSN2RNNHYyTnYzL2s2QzcvQ080?=
 =?utf-8?B?TTNZTFdpYkRsWWduNHNURUoxTFQ1WWk1UmVWUDVES0lKVnBDeTFsMms1cE5t?=
 =?utf-8?B?Z3FqdSs0QWdNUFBLa1Fic0t6Ukh3eFVlUmswczZZWWU0WjlpVTkxUTJpZGph?=
 =?utf-8?B?Qkt2cHBZOVpHMU9iLzEyam0rdGRDZXRaNVNHNmRocTJFSVBFNUJDWW1LaW5G?=
 =?utf-8?B?ZmVoQ1BpQ1FzK2NWcHJ6aWFaalRpK3pPWmVxOVpEQ3c5NTExdGhybGNZdVA4?=
 =?utf-8?B?eGdaTnlzWmlZNHZsZjZRQXJra1gzTFBnM0t3L3A2VlpTc292RXlreWZoeVVB?=
 =?utf-8?B?Y21vK21xMTQyZ0lTV0E2THp6WVdkUTVnK2lBMDVhUWRBWXFPdXcybE52Z1pu?=
 =?utf-8?B?c3A0QktPdUdPSlV5aFpGMGhxZTNMK1Z6NEgvK3pDZzlhdTNMaU43R29Lc2NW?=
 =?utf-8?B?RXRmd21tVldWOTMvQjZTcHdOSW1QQjhuQy9iVWFleDd6QWNTd1h4NjZNZ2VB?=
 =?utf-8?B?aDhEbVBUa0FHVXh2SU9EYnFLa1ZhZGlqSml4dG9wSDFsNmFDbkhveEtha2JL?=
 =?utf-8?B?UWZEaGdKRXdZYXpWRVRaUlZIRml4TkJIcHBKMkpZUk9EVXNGSlFONzZ4Wkhj?=
 =?utf-8?B?U01JTEd6N3lZTExiSlJBWFcreTE5b1ZqZ2lldy9pQTRaU0FLclhqUnhLRVVV?=
 =?utf-8?B?YTdLZVFrUWo1ZmN6Q2hRZ2ovYW85T3c0eVBrdThVQjRDSDBhOGpMNnFoM0NM?=
 =?utf-8?B?c2hCWWNIK3hBY3VkY2E5NWxUYkVQNXg0b29iQzJsRjNvUEJ4eXRBU0djUGpY?=
 =?utf-8?B?TEtKdWZkWG9uRjZyd09pMlRzaHZWRC8rVUFyY04xWm5iRWlrVjNwVmdqSjNK?=
 =?utf-8?B?cTQ2U0J0a3J0bXlhejYyc0g3SVl5bW5Rc1h3cm9KUlhhcmM2bS9XaEkvQi9p?=
 =?utf-8?B?dStoTHhjcmNkUmhiUWVZN01Hb1gxTjk1VFE1YnNqZHMxNzBvbmtaZnNVWlEy?=
 =?utf-8?B?di8yajRnRzE0ODBWbzY0RmJOWlJwNElIdVFYMDU1MEVCK2laV05ZMEJ3RlpW?=
 =?utf-8?B?UW1Pa3o2UHRVM0tQUysxVkFMSzZqNEZPR1JBOW5VVWlNZnhvOEl6M0k2alBK?=
 =?utf-8?B?UloyVTY0UExNTWFDMTd0L1A4Z2RXeHl4UGdEY0JZR1Mxd1FtK3dWektZK3ls?=
 =?utf-8?B?UDA3OUpnMmkzSWFpb2kwb21pWmNNaHdXZFRJSlM3eG9RZ2xTNWl2UWViMi9D?=
 =?utf-8?B?TzVFajVxZk11cnVITnFvOEVpbWlKZVNJZGpNR1JWWTg4WS91a1ZKWFplWkQ0?=
 =?utf-8?B?WUpVUlp0SmtLRFdMOUJCT2F6aDNDbVZGSlhuaXR2VnJBSXdLUHlyeTQ0OXE0?=
 =?utf-8?B?NjZ6UDg3Y3grK1BSaTNCeWpncGQvdjFvNnhXckFEQ1M3UncyZ1dtbkowcFZh?=
 =?utf-8?B?YUU4NFZISWZGaEtFNkE3TTRKUytnd21DZVZwRWI3TEl5U1ZRbFA3RElURWNm?=
 =?utf-8?B?amlDSkJELzdHL2c3NEE3OTJqYkk4U2hMZGNpdUp2aVkyNDFGVUcwcldQLzZL?=
 =?utf-8?B?SjczQTErZHMzczEvM2luRHZ4ZnRoQzNTNFZmYW5MdE1qZWt4VmN4ZzhxT2lz?=
 =?utf-8?Q?TDiVHBVd7I1Sfm/Q/u0dBg18F47cfxzZLt0DhJY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6276ade4-c9d8-43c3-d3b8-08d94b9f91ce
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:58:16.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+oIxZTxpEyHlB26Es/jW0UoE5kWF590RcVhsA/j553G5dUknDTbtOC9FWjLBDG6AFSTItscl8KihWQ79Kyz1CmBNmKO6lnE395rFcShpss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/19/2021 3:48 PM, Rob Herring wrote:
> On Mon, 19 Jul 2021 11:20:00 -0700, Alex Helms wrote:
>> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
>> The 8T49N241 accepts up to two differential or single-ended input clocks
>> and a fundamental-mode crystal input. The internal PLL can lock to either
>> of the input reference clocks or to the crystal to behave as a frequency
>> synthesizer.
>>
>> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
>> ---
>>  .../bindings/clock/renesas,8t49n241.yaml      | 190 ++++++++++++++++++
>>  MAINTAINERS                                   |   6 +
>>  2 files changed, 196 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>>
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

Thank you for the info. I'm new to the kernel process and appreciate your advice.

I felt uncomfortable adding your Reviewed-By tag but since there were no changes to the dt
portion of the patch, in retrospect I guess I should have added it. I'll keep this in mind
for the future. Is there anything I need to do for this patch?
