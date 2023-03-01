Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0476A7624
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 22:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjCAV1J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 16:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCAV1J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 16:27:09 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7EF515D7
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Mar 2023 13:27:06 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536c2a1cc07so390099867b3.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Mar 2023 13:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677706026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZQ6NryszKqEgo6HI/pNRwlFeVgJUI6LFlsCzrMdZac=;
        b=NpvrWnan0KtOpYnMajMQidSkRlc+fW82x+E3nS+ke4Nqu8oYVgI4cHeC3YgENOPRTu
         voVchR4WvD1spg6cEO3ARDxcI75LCb4MZGhZRzzdZp1YlrTzUn7P10rxkhUqTavMkvfz
         X/nhYjNvizOAE3Kz9gDZITMzdnjFVnN3wco/DTgthfbDs+9OhQ6oz2L3CMqFtSrlaBh/
         5qqqQn6LHMa2cGyBTPxP2EKZbbc6fWjMoMMPeKGrjKK0zfMlYDPzZyjSmIs8Dj8gOa3I
         kZ6sMIlUs1m+IUvuggzFIcI85la1o+6uvacy39lsQTxCLsRipu/UttluXQa9FhMmoBXL
         jHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677706026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZQ6NryszKqEgo6HI/pNRwlFeVgJUI6LFlsCzrMdZac=;
        b=yCRaURgXgnUoOeMGmvQDrYWmv87Si5uyaRvxK8Em1UrMwVtvoqPWR1W/IXK5pM+8Kf
         Om0F3qaXmPyQzdhJvGuB7PfkChlU3HF1TG3vubyyjMRM5ygc7kJ/xCaH+BX3+fs8Q3K5
         kSIiAR2sy+6BTpRYZuGc2ICOfiAmx1jl7wrON7JtsEBiSggifjZshi/sjz3dtrFFdaxA
         +YuMdY4gc4SActP2QAVrO61hkBNKi4RyBllj/JwmNlqO60tQf25RUhiXsU5Q6pRJ6ew4
         gutYeL2qBcbknSLfMdtp94bzKYwNYuTNpXZqtm7m/i8kLXQjVwSaTjNvdrhmgELak7EI
         XhVA==
X-Gm-Message-State: AO0yUKXRoro0H6UK/ssIIFQ07E1/SR2rFbLjqZHEQTW0x1oOi1bPjEbt
        ErGeYXIVU5NUNbtOOY1W9vBpN+Wb07MQRfguyVZ5m3yJC8lQLA==
X-Google-Smtp-Source: AK7set/b8yVL1xVpK7MpL7ZJS4XJdhHV+jqkMXh8JUDChxR9QtACSaqCtw6tNw4ZokC7uDd3aYdRnb2A3WIxuNfaJBg=
X-Received: by 2002:a81:ac59:0:b0:535:fe26:acc with SMTP id
 z25-20020a81ac59000000b00535fe260accmr4901270ywj.10.1677706025276; Wed, 01
 Mar 2023 13:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
 <20230227183937.377612-5-ralph.siemsen@linaro.org> <20230301135808.6fefe5b9@xps-13>
 <CANp-EDb3XPEHya8igTh9fnyQW9yUs2MM6tCD9Pa3DCSwNZGvVg@mail.gmail.com>
In-Reply-To: <CANp-EDb3XPEHya8igTh9fnyQW9yUs2MM6tCD9Pa3DCSwNZGvVg@mail.gmail.com>
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
Date:   Wed, 1 Mar 2023 16:26:54 -0500
Message-ID: <CANp-EDYuX_zi=XG_AhLP0tH9mnQzTK0GiyTzSQEkPMUo5JC28Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a06g032: improve clock tables
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 1, 2023 at 2:19=E2=80=AFPM Ralph Siemsen <ralph.siemsen@linaro.=
org> wrote:
>
> > > The bulk of this patch converts the clock table to use struct regbit,
> > > making use of the RB() helper macro. The conversion was automated by
> > > script, and as a further verification, the compiled binary of the tab=
le
> > > was compared before/after the change (with objdump -D).
> >
> > I will trust your tool on the conversion.
>
> I'm going to check again using objdump, just to make sure nothing slips t=
hrough.

So naturally, this test uncovered a difference. It seems that gcc
orders bitfields differently on x86 and ARM. So the tables did not
match exactly with the old packed u16 fomat.

It is a harmless difference, but it can easily be eliminated, by
swapping the fields within 'struct regbit'. Now the tables are really
identical.

Patch v2 to follow shortly.

Ralph
