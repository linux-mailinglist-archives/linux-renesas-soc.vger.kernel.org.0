Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C0D524E07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 May 2022 15:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354128AbiELNRK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 May 2022 09:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354107AbiELNRI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 May 2022 09:17:08 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F989246422
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2022 06:17:07 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id c14so4780995pfn.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 May 2022 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Rnogcr7ZLfXOCRxe1rwlddRUy0BjLUcz0t69pn/hTu4=;
        b=nv0VJ9RtQ7tENtK6DIZdWB6Ve9yCDvQQUu86pQNzyQlV0rRZqWVxie/vRJ18bd96Kg
         b+zlA0bhhDfLWN+063m0e2ru4sdkGRICUjvVRLv0Tx3Y4Lb7oHjRzSWS+5L+uznnCQwr
         zy7+O6ODu8zEiQvjLBT5vbjVQPVCIgFnM3pBeRC0O4IF5aLMB/JD+MLI0lp9d0KuTVzT
         FNHNv90g7Rd4Vk1fcnnQQgSLZyAPjQkJUvtAP5zWopjSzImR1L1Mui3ysusWOaAcDG4b
         u8LFXmUD9eUIrUJmxHTy3pkklaB4ZbBgBY+9xVQD44qsek6dIgpz1f9R5ed+Zn4lpJvK
         bW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Rnogcr7ZLfXOCRxe1rwlddRUy0BjLUcz0t69pn/hTu4=;
        b=wUiGWyWaS2LOZrHfhzkI+bEXTg78OKu8o8+ub4/+cHd1jxrmVLLh7WtxniOxhCMQoZ
         yr14HF9x7dRzUXDaTb2h3FkRimqkWn0msDYsWpXdGXptt0xbcy60LUiiXv6912zm+A9A
         09pJOco4xIwpNtARdz8fPnXjCbY7ql0mY/URB7VSSFCt1vEXZX4Q+ahtrxPQvbZm/H23
         y6nExZrlph/qpV9xKJZ9LZMmY8B8+Url9oeio1QtUXx6T7aqItl5mlMC9iXbrVJ/M6Hb
         JvUNy9ZbA68U8fY+lpYC9CV3BSFjzJIQH3Yv7Z9xpOFGljWOAkKQrb1Kd4fbhjx+EvZZ
         ZiyA==
X-Gm-Message-State: AOAM532Oec84ahvn0Bvz2Ejz9hejhkwkjJnnCQDKyrPBKlaymzFyiXE4
        5pPDbAURcOUAVS1NtywIj9NSQ3mXlFlFBdpvf+k=
X-Google-Smtp-Source: ABdhPJz6yF0AtZdrnKjsZUDB5GvbNMYhFwIviGQHoklgj0JHWnufcPhdTkLgWAgUp69VmdgP7fe6dRFy4EakmNIm2Hw=
X-Received: by 2002:a05:6a00:1252:b0:50e:9fc:d5b7 with SMTP id
 u18-20020a056a00125200b0050e09fcd5b7mr30043915pfi.85.1652361426949; Thu, 12
 May 2022 06:17:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:f00e:0:0:0:0 with HTTP; Thu, 12 May 2022 06:17:06
 -0700 (PDT)
Reply-To: usmankido.lawfirm@gmail.com
From:   Usman Kido <beckydessi01@gmail.com>
Date:   Thu, 12 May 2022 06:17:06 -0700
Message-ID: <CABowprE3KK1cKB3Bbod+6OW7wdBNZawNbwnTNqVVZ=ueWbfWHw@mail.gmail.com>
Subject: GHreeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

GHreeting,

Hello, I hope you are doing great today

=E2=80=8BI sent you mail earlier but not sure if you received it. Please
confirm receipt of this message as I have useful information for you=E2=80=
=8B

Best regards,

Usman Kido
