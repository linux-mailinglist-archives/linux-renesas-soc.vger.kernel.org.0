Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1779D56500F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 10:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbiGDIxc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 04:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiGDIxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 04:53:31 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB68BC99
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 01:53:30 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 68so8339947pgb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=siLArdMJe3L+kNr+KNojDKyERV4yjrjjOjLvA1GxJCU=;
        b=AmMl9RmSuiCZsMXH/6w1YevFF66aYutSWCsHZ0pswE98hz5wzqMbPY1rPErfeliSDQ
         NSTKBxAAUQahWJEjlXDsd6K8oUna1OKiHhKizopxNVsrlq81UwUGlV/kCfnOwzYKQuL+
         FB/Nv0hmjlba8WtuVdoOakSt+nd4fGjauvalDhSWdRBsBbqtS163S7nkg3mhwMKOBFZs
         u9N9LCV9jNP81JYCnpQPkGokZGNlOwwGYfWihALAWFGsK8Qsh3Slacdc/UsqywTVH6p/
         7yDsHAf3O2eHSIM2gGwGVtBXDLLv2ipOCnkM/nglAKA+WYBmVqy6NXtYsZDwCYWXqTOm
         wSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=siLArdMJe3L+kNr+KNojDKyERV4yjrjjOjLvA1GxJCU=;
        b=HyyXNqUS1uPaSvKeQebbatEKDSN8ETrvp+df4z272thXlSFxdVzWMxcCnuPgJxAVXP
         Cq5lD8qrpktTP2uTVzoDICOB4MoJluphoH2NQl9zi1BP1z0WuvOZH1yjbV/uN8/O1/rL
         AmBfvtym4j24a2voo10IpDKJrko0nZihE3qsvS0ozMqQ0lFno6ja88yZrRr+KcEH6oqR
         3hTE4+2OrnMesH5roQYe1N7tR0Eu2R2b+HxCC8yUpa/vs4vk2ajlQSvlTxh8daTMTGcD
         dronlEseaMld1XhiJD5EzCd96MgTYVVov9QtDAb+dw5x4iEXPnKUOKm/G5MMsb/RdPSM
         hJQA==
X-Gm-Message-State: AJIora93YM/IHlsAOQUGv0yzx+bJwnMer4dw+4VhYY6bR277e3BB32Mp
        O2CXlItG9Kid1PBhT4KBu+hiNEEyqtPJnAvA
X-Google-Smtp-Source: AGRyM1tMYK92DHljQQbmUZPnp46BqFwcwjv5Svwlt3gtBZXwPMQXvB+9R/xdyn3YnLwDWY9x9uoUTg==
X-Received: by 2002:a63:90c8:0:b0:40c:a28a:55b4 with SMTP id a191-20020a6390c8000000b0040ca28a55b4mr24863373pge.134.1656924809779;
        Mon, 04 Jul 2022 01:53:29 -0700 (PDT)
Received: from smtpclient.apple (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id s21-20020a056a001c5500b00525869e6ffasm18400724pfw.120.2022.07.04.01.53.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jul 2022 01:53:29 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 1/3] tests: Support enum property type
From:   Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <c49456df-7f49-acf8-9bfa-cecf9b85f45f@gmail.com>
Date:   Mon, 4 Jul 2022 17:53:24 +0900
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <546B54F4-5931-4CAE-A910-A6ED2F3C311A@igel.co.jp>
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-2-taki@igel.co.jp>
 <c49456df-7f49-acf8-9bfa-cecf9b85f45f@gmail.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

> 2022/07/04 17:43=E3=80=81Sergei Shtylyov =
<sergei.shtylyov@gmail.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> Hello!
>=20
> On 7/4/22 5:56 AM, Takanari Hayama wrote:
>=20
>> Add a support for enum property type to AtomicRequest.
>>=20
>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>> ---
>> tests/kmstest.py | 12 +++++++++++-
>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tests/kmstest.py b/tests/kmstest.py
>> index 11cc328b5b32..224c160e32fa 100755
>> --- a/tests/kmstest.py
>> +++ b/tests/kmstest.py
>> @@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
>>=20
>>                     min, max =3D prop.values
>>                     v =3D min + int((max - min) * int(v[:-1]) / 100)
>> -                else:
>> +                elif v.isnumeric():
>>                     v =3D int(v)
>> +                else:
>> +                    prop =3D obj.get_prop(k)
>> +                    if prop.type !=3D pykms.PropertyType.Enum:
>> +                        raise RuntimeError(f'Unsupported property =
type {prop.type} for value {v}')
>> +                    for value, mode in prop.enums.items():
>> +                        if mode =3D=3D v:
>> +                            v =3D value
>> +                            break
>> +                    else:
>=20
>   Hm, doesn't seem to be correctly aligned?

That =E2=80=98else=E2=80=99 is for =E2=80=98for=E2=80=99-loop. Am I =
missing something here?

>> +                        raise RuntimeError(f'Enum value with name =
"{v}" not found in property {k}')
>>=20
>>             if not isinstance(v, int):
>>                 raise RuntimeError(f'Unsupported value type {type(v)} =
for property {k}')
>=20
> MBR, Sergey

Many Thanks,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/
