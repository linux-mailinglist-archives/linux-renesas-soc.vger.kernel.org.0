Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29273D2594
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jul 2021 16:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbhGVNky (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Jul 2021 09:40:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:43018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232332AbhGVNjc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jul 2021 09:39:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFE616135B;
        Thu, 22 Jul 2021 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626963601;
        bh=mJ3JdT0Jl0HeZBBxWkcKK7bwXZcdzgqg5y3jXt3+kZs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ENCgLVRWTYWJGmbpAbWSfCDWo21E52HEXh7c50OdL/+YGGo4tdSiNuuo+dOLYkEsX
         6QIfpekMB7Dy5uaOoI6/ve7Fg4ujPmH0iVrjeO0O/a88Y+Nhul0jarTbME/G8yYD3j
         EdVDQnDzwW9ZDYTiD5Xu9lahxyOo63mZDqk1angMstTmSTOPOfy1JREfjZM3A4SdTH
         u+PA7jaWbcQAcZAgP04bniCthOJbRwKBxHjrNzXVpLk52i7IrBVVpGOAI6x7OXjKM/
         ynpK5INQnHPg5ZMtvF7nwE4uiV2uqb2pG5Dxth9b80+AsYiJPCKy/QgPgCfciOU+AN
         IvtT5iQbHTfQg==
Received: by mail-ej1-f51.google.com with SMTP id qa36so8593607ejc.10;
        Thu, 22 Jul 2021 07:20:01 -0700 (PDT)
X-Gm-Message-State: AOAM530jrq2ylAhf8X19GC7KWhr62T4XEF5Lkx1MsS07a24Hul/YYAq7
        Pq8ecTOrQj/hCXf8S4y72vQ4XuiZbGlluw8DbA==
X-Google-Smtp-Source: ABdhPJzPx2tAkBfnTYAJdL+pjejcJt5SFRuqenmexCc8UCCTJ3rc8BOHTUiTGbeTgwSbLXr4S6GftAjXVwj1/pePKQI=
X-Received: by 2002:a17:906:28d1:: with SMTP id p17mr153498ejd.130.1626963600297;
 Thu, 22 Jul 2021 07:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210719182001.1573-1-alexander.helms.jy@renesas.com>
 <20210719182001.1573-2-alexander.helms.jy@renesas.com> <20210719224804.GA2768983@robh.at.kernel.org>
 <6fbb307e-8835-224e-7912-2b956985a713@renesas.com>
In-Reply-To: <6fbb307e-8835-224e-7912-2b956985a713@renesas.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 22 Jul 2021 08:19:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+2tpjNffzNPDa2XSZWAk3B-HS-bF7EmZ_j0t_=nfEWvg@mail.gmail.com>
Message-ID: <CAL_Jsq+2tpjNffzNPDa2XSZWAk3B-HS-bF7EmZ_j0t_=nfEWvg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, david.cater.jc@renesas.com,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 20, 2021 at 10:58 AM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
>
> On 7/19/2021 3:48 PM, Rob Herring wrote:
> > On Mon, 19 Jul 2021 11:20:00 -0700, Alex Helms wrote:
> >> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> >> The 8T49N241 accepts up to two differential or single-ended input clocks
> >> and a fundamental-mode crystal input. The internal PLL can lock to either
> >> of the input reference clocks or to the crystal to behave as a frequency
> >> synthesizer.
> >>
> >> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> >> ---
> >>  .../bindings/clock/renesas,8t49n241.yaml      | 190 ++++++++++++++++++
> >>  MAINTAINERS                                   |   6 +
> >>  2 files changed, 196 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> >>
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
>
> Thank you for the info. I'm new to the kernel process and appreciate your advice.
>
> I felt uncomfortable adding your Reviewed-By tag but since there were no changes to the dt
> portion of the patch, in retrospect I guess I should have added it. I'll keep this in mind
> for the future. Is there anything I need to do for this patch?

For v5, no. If there's a v6 posted, then add any tags.

Rob
