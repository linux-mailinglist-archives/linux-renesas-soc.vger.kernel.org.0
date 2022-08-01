Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9375E58665A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Aug 2022 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiHAI3H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Aug 2022 04:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiHAI3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Aug 2022 04:29:06 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F90A33353
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Aug 2022 01:29:05 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f11so9071207pgj.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Aug 2022 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=Mo8Hk9gh22kuuYsQuSBlDJZYvkrG1A1nFS1goqVw6fU=;
        b=27SCBapGJF0trAIwMLPmtLipjiKqxZhbf743SDqmWI79VGXvFC9nqjcImIe79rDuzW
         WXZ+c6q0xp7ghX5YMS7QtikPWx0n9SPvDmkwibVw5tHJlXD+Zb6HIwGziL0cFGJH/UnA
         ri1zI1EA7Y7qdAIt9G2a2wgPpXIAd3sX0UOgE/ickX6HGDWo4ERbSLmKj4aTH3foof/v
         F4idREORGZHrPEE+HpykMnPJ5K46RJf6z6HHGdZdEMC2E0hNrI8+phdDZHEGjqc4yKn1
         OHArif9Pdfm7W04rR8KCHZA9RoTdp1QccrwLTaTd9UBYDHY9by0jYXl/X/Usn2s0oz4f
         xivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=Mo8Hk9gh22kuuYsQuSBlDJZYvkrG1A1nFS1goqVw6fU=;
        b=vt4+91nuBbsL0aySCUC6K4bDM9Xn/wHECUIbNaLkuHjllTZyk3saMI7GpjHLjsdDbb
         54jME0JmjS/RiG5rXmHsb6wxBj9R0NSikjybYJ0IZNjvuCHTvQB3UE8OQp9U7cwpwPTW
         MjUkUXL2qjGDG47Z0byJ6vT7cJBKZiBs0ySB86vNZJn3uFwbR2tjBRCkPP2SbVyreTMd
         MTISCfX42UkAKqiYGYohTQERaouitKZJ9Rw/kNBGAhiGwxBHpAvpHBbVmMu9RQ9SwlnS
         6g7p9YX5AZgMhSHEdYhEpACWvFebDH7tSPfD1VTZzUJNidsumhkRh1TyzHblD6iTzckm
         dZDw==
X-Gm-Message-State: AJIora+UoiPvmdBEEkGr8LEcifPEBeoyhvOyxdlO8RsJ9H+U+o6wPRSk
        15X6AE69c3fjDDYGTvApLUa8pGCrseuymA==
X-Google-Smtp-Source: AGRyM1upTUJBr3OdkebNd+6kcLJ6TfFdLXhSyQ/VCGdwTqvO9ykQn2v7PW3YtT4D6VZH4rdTt5Gc3g==
X-Received: by 2002:a05:6a00:16ca:b0:52b:cc59:9488 with SMTP id l10-20020a056a0016ca00b0052bcc599488mr15079688pfc.0.1659342544677;
        Mon, 01 Aug 2022 01:29:04 -0700 (PDT)
Received: from smtpclient.apple ([240b:10:c080:a100:961:ad60:8d36:c3ca])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090a690100b001f4cc17b451sm5098546pjj.5.2022.08.01.01.29.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Aug 2022 01:29:04 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 1/3] tests: Support enum property type
From:   Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <YuarTkDWaYjvAl/h@pendragon.ideasonboard.com>
Date:   Mon, 1 Aug 2022 17:29:01 +0900
Cc:     linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3CED4D6A-FF4F-4C02-B9F4-27236B726551@igel.co.jp>
References: <20220704025632.3911253-1-taki@igel.co.jp>
 <20220704025632.3911253-2-taki@igel.co.jp>
 <YuanO6pgmtEvfwRj@pendragon.ideasonboard.com>
 <YuarTkDWaYjvAl/h@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for reviewing the patches.

> 2022/08/01 1:18=E3=80=81Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> One more comment.
>=20
> On Sun, Jul 31, 2022 at 07:01:00PM +0300, Laurent Pinchart wrote:
>> Hi Hayama-san,
>>=20
>> Thank you for the patch.
>>=20
>> On Mon, Jul 04, 2022 at 11:56:30AM +0900, Takanari Hayama wrote:
>>> Add a support for enum property type to AtomicRequest.
>>>=20
>>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>>> ---
>>> tests/kmstest.py | 12 +++++++++++-
>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/tests/kmstest.py b/tests/kmstest.py
>>> index 11cc328b5b32..224c160e32fa 100755
>>> --- a/tests/kmstest.py
>>> +++ b/tests/kmstest.py
>>> @@ -269,8 +269,18 @@ class AtomicRequest(pykms.AtomicReq):
>>>=20
>>>                     min, max =3D prop.values
>>>                     v =3D min + int((max - min) * int(v[:-1]) / 100)
>>> -                else:
>>> +                elif v.isnumeric():
>>>                     v =3D int(v)
>>> +                else:
>>> +                    prop =3D obj.get_prop(k)
>=20
> I've run this test on a kernel that doesn't support the blend mode
> property, and the prop.type access below raised an exception that =
isn't
> very nice to read. If that's fine with you, I'll add
>=20
>                    if not prop:
>                        raise RuntimeError(f'Property {k} not supported =
by object {obj}')
>=20
> here to make error messages more readable.

Right. That makes more sense.

>=20
>>> +                    if prop.type !=3D pykms.PropertyType.Enum:
>>> +                        raise RuntimeError(f'Unsupported property =
type {prop.type} for value {v}')
>>> +                    for value, mode in prop.enums.items():
>>=20
>> I'd replace "mode" with "name" here. Apart from that,
>>=20
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>=20
>> I'll change this when applying the patch.

Thank you.

>>=20
>>> +                        if mode =3D=3D v:
>>> +                            v =3D value
>>> +                            break
>>> +                    else:
>>> +                        raise RuntimeError(f'Enum value with name =
"{v}" not found in property {k}')
>>>=20
>>>             if not isinstance(v, int):
>>>                 raise RuntimeError(f'Unsupported value type =
{type(v)} for property {k}')
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Cheers,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/

