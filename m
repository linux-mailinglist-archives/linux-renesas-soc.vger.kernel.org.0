Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB52565085
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 11:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbiGDJOB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jul 2022 05:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233590AbiGDJN6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 05:13:58 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B097B5599
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jul 2022 02:13:57 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id fz10so2628640pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2022 02:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+nqGS16NT0NTN0mRgxUN6PGiGsf6iWMD2wun7NgoXhE=;
        b=lNJlWWTgSmiLQxTSLFfLyXaVuLj+wTO0fVhHN8YGwfHyZrGxehOO4wr6NcUxpfCXrp
         c3P3pLWVhYkTs2r2W8IDY+GuAWGooL38/RBbgl0bYBGlxz+CTe5ydK2YejOecIE/YR5B
         eWTjUsif8jQHFK0A+3xCmTBFvVG349I8ZVMc3TYmcFJ7NdhEMI5twHwgJbvVyUuPx2aM
         5dDpcEGuDYbZrGFytREO2XJ+iNdnmJnebYdwp1EkQ05eW75tuEABHZdDqBD1JTRD6lBh
         zzxpT8Yxf29DQY+w6+xk+xCHX+J+zMaaM3wvJhFr8xV58vCmwMG4zIRbKYOy+3W7mR2r
         H1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+nqGS16NT0NTN0mRgxUN6PGiGsf6iWMD2wun7NgoXhE=;
        b=ZrfwRbesZWOmTschLJjCVYVlc/6IwOkjfeKcPYki/wTy7xWdUf6WcqCAlu9yo1/V60
         0IEHvpbY38IXbQQeT67FE/lrzkmDmBHQDwi+oQHwCzjN3EPTDnlgHP7lKfMN4Pv+WHFE
         Zkgw0zEC8ZYkO8dNO5VkHX1M8dsyTR+jwegpxGqhQ28fBG34PYhnDgXxMduQ05u/y5ks
         bKr8DMeiCA4sBLt+wY5hO9vVlr20Hkzwq7/ZdKkNc/lNhVQj78o8nqcRgxRZySc/49we
         nUZdqs4b2mzL2AKLBYiB+kY2A/bQyiQtqwH9V3LDIjLrLwtorN1k1s2DE9bAni9TUoBn
         ZvzQ==
X-Gm-Message-State: AJIora/YebMB3P8vnxGbJn5RdCVjm5tsTGme7lrN1EjCI4xTatyy8ijx
        +xHJNfIWSWHz0trBL6dZqKFK6Q==
X-Google-Smtp-Source: AGRyM1shNkLiSal64fXQ76P3AQStM4IjG6FF42wEnK3QCtSKWQQgADgQusUNcBMhP665AZC9xIfrkA==
X-Received: by 2002:a17:90a:e008:b0:1ef:831a:1fff with SMTP id u8-20020a17090ae00800b001ef831a1fffmr7445938pjy.221.1656926037095;
        Mon, 04 Jul 2022 02:13:57 -0700 (PDT)
Received: from smtpclient.apple (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id k22-20020a170902761600b00167942e0ee9sm20611131pll.61.2022.07.04.02.13.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jul 2022 02:13:56 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 1/3] tests: Support enum property type
From:   Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <743e8135-391b-e00c-2493-4b4052a66ea3@gmail.com>
Date:   Mon, 4 Jul 2022 18:13:51 +0900
Cc:     linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9A43BB2-B039-4F5A-AC2E-A68E439C6A92@igel.co.jp>
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-2-taki@igel.co.jp>
 <c49456df-7f49-acf8-9bfa-cecf9b85f45f@gmail.com>
 <546B54F4-5931-4CAE-A910-A6ED2F3C311A@igel.co.jp>
 <743e8135-391b-e00c-2493-4b4052a66ea3@gmail.com>
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

Hi,

> 2022/07/04 18:00=E3=80=81Sergei Shtylyov =
<sergei.shtylyov@gmail.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> On 7/4/22 11:53 AM, Takanari Hayama wrote:
> [...]
>>>> Add a support for enum property type to AtomicRequest.
>>>>=20
>>>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>>>> ---
>>>> tests/kmstest.py | 12 +++++++++++-
>>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/tests/kmstest.py b/tests/kmstest.py
>>>> index 11cc328b5b32..224c160e32fa 100755
>>>> --- a/tests/kmstest.py
>>>> +++ b/tests/kmstest.py
>>>> @@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
>>>>=20
>>>>                    min, max =3D prop.values
>>>>                    v =3D min + int((max - min) * int(v[:-1]) / 100)
>>>> -                else:
>>>> +                elif v.isnumeric():
>>>>                    v =3D int(v)
>>>> +                else:
>>>> +                    prop =3D obj.get_prop(k)
>>>> +                    if prop.type !=3D pykms.PropertyType.Enum:
>>>> +                        raise RuntimeError(f'Unsupported property =
type {prop.type} for value {v}')
>>>> +                    for value, mode in prop.enums.items():
>>>> +                        if mode =3D=3D v:
>>>> +                            v =3D value
>>>> +                            break
>>>> +                    else:
>>>=20
>>>  Hm, doesn't seem to be correctly aligned?
>>=20
>> That =E2=80=98else=E2=80=99 is for =E2=80=98for=E2=80=99-loop. Am I =
missing something here?
>=20
>   Hm, I don't really know Python, can it actually have else for
> a loop?

Yes. :)

> When the items are exhausted (which is immediately when the sequence =
is empty or an iterator raises a StopIteration exception), the suite in =
the else clause, if present, is executed, and the loop terminates.

=46rom =
https://docs.python.org/3/reference/compound_stmts.html#the-for-statement

>=20
>>>> +                        raise RuntimeError(f'Enum value with name =
"{v}" not found in property {k}')
>>>>=20
>>>>            if not isinstance(v, int):
>>>>                raise RuntimeError(f'Unsupported value type =
{type(v)} for property {k}')
>=20
> MBR, Sergey

Many Thanks,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/
