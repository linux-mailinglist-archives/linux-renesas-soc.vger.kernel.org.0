Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5FB5F2CB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 11:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiJCJC2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 05:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJCJCK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 05:02:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3C363EF;
        Mon,  3 Oct 2022 01:51:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39853B80B06;
        Mon,  3 Oct 2022 08:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E250C433D7;
        Mon,  3 Oct 2022 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664787084;
        bh=6D6zwE2KTWX7Fc8+lXpr+HP/ieLEYgISlxAUy/PW+8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVNS0JOtaF6BPUZYWYvaeXu7563sidQi5qf794FP0/CCcvJyJEAkYamGi3ZD54grW
         E9oaWKIo1sANkhWhAdwdqKDpEE1otezBE6nZXUCNpfsNCIvj98L5K1rhkiHd/fH8k5
         qv0nXlU/y3RCAhfj4QZU8I/a0IY2XNNq4klRtV5b/uAr2j1uCsqI9tVXMU5VWhWuMX
         QhAAzWPkAh9w8cHUtYpjcSYcDgyCkw5PuevotuvYlmDlthWC/4NKNhsmWeawrc0pYI
         sybunuuTMl//7d7YFdmF+JASU92tNBbezKlH4ZxKnw0Pt5vXE9GXqy8xwLwu9iwySw
         73E/vXlsrPrQA==
Date:   Mon, 3 Oct 2022 09:51:18 +0100
From:   Lee Jones <lee@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] dt-bindings: mfd: Document RZ/G2L MTU3a bindings
Message-ID: <YzqihszpUlF36yqn@google.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
 <20220929103043.1228235-2-biju.das.jz@bp.renesas.com>
 <YzXbrZNI81f1ebBt@google.com>
 <20220930174707.GA567190-robh@kernel.org>
 <YzqQdUcsvu4AJPj2@google.com>
 <CAMuHMdXMy0cZEhT4R+19NgrEtF8a_TqN1hXM8LZ_HvYD+oYaag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXMy0cZEhT4R+19NgrEtF8a_TqN1hXM8LZ_HvYD+oYaag@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 03 Oct 2022, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Mon, Oct 3, 2022 at 9:34 AM Lee Jones <lee@kernel.org> wrote:
> > On Fri, 30 Sep 2022, Rob Herring wrote:
> > > On Thu, Sep 29, 2022 at 06:53:49PM +0100, Lee Jones wrote:
> > > > On Thu, 29 Sep 2022, Biju Das wrote:
> > > >
> > > > > The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
> > > > > the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
> > > > > channels and one 32-bit timer channel. It supports the following
> > > > > functions
> > > > >  - Counter
> > > > >  - Timer
> > > > >  - PWM
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> > > > Not sure you need to list all of the IRQs in the example.
> > >
> > > You do, because that's what the schema says is valid.
> >
> > You have to use the exhaustive list?
> 
> Yes, else "make dt_binding_check" fails to validate the example,
> as the schema says all interrupts must be present.

Okay, so all of those IRQs are compulsory?

Makes sense then, thanks for the clarification.

-- 
Lee Jones [李琼斯]
