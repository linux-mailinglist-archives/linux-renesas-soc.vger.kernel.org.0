Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F1F265A9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 09:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgIKHh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 03:37:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44308 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgIKHhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:37:22 -0400
Received: by mail-ot1-f67.google.com with SMTP id a2so7561003otr.11;
        Fri, 11 Sep 2020 00:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vO3shii/E7fgPE7FHhT9bDipzvL+QVGM4jZh7S0ik5Q=;
        b=D1osL9si4BRxEVRZicTMRQ/8l1TLNZnfyK/8lzb8ZEg80G47q1YnULGyRY1uIakFpQ
         yPodHuCeqIZvRbc6Bx4F4OBr/3TmGOjRz83vuZ0z4msLj5DZHFHExYCurSSgRUlbMorb
         +xfhk5Qi9UhQ2GFucmw4Uh278Fbqr2JgQjiV+f8Xe5qaYNCoRF0ieoYsr6LRzCJRiqZs
         xVZQVcQ5GChV6wrqco3sdn+1C2d0KFg8iHWdobeRq+rXrgR6+0KAj6164P3AJVod/0rE
         C7QZD8SGU6yytovJtA5wtv6e152APVayvnffSSzt8OJkCmJ6agTIILiBiME9SI6NNbaF
         rHHA==
X-Gm-Message-State: AOAM531iYL+eq1JwJ6Bh7hxfd+biSAAZUv2TaFQE1y5Ewm1hzKgl2AbO
        sE/jmZu8ewpFQ0iUV930BIyK6Rm2wW+JSmIwUrjb5Mia
X-Google-Smtp-Source: ABdhPJxcwMIwnS7iUfHMr6autuHPnOKVqu6GSLZ4M208xRRY0vxpd3q85CZDkM3kLC3ZxIamOVWdfXV+o834hcATMyw=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr417440oth.145.1599809840778;
 Fri, 11 Sep 2020 00:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com> <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
 <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
 <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com> <CAMuHMdVGFOaBFCejGDgzf8AUbHFis0TOM-DDJ3h9k0+fuu=umQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVGFOaBFCejGDgzf8AUbHFis0TOM-DDJ3h9k0+fuu=umQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Sep 2020 09:37:09 +0200
Message-ID: <CAMuHMdUxCq+yawHsgJZYiEwaFLo-J9vJL8yiom=zsVVUVCdS4Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 10, 2020 at 1:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Sep 10, 2020 at 12:34 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> > On 10/09/2020 10:44, Geert Uytterhoeven wrote:
> > > On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
> > > <kieran.bingham+renesas@ideasonboard.com> wrote:
> > >> On 07/09/2020 03:59, Kuninori Morimoto wrote:
> > >>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >>>
> > >>> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> > >>> This patch is test on R-Car M3-W+ Salvator-XS board.

> > >>> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > >>> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > >>> @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
> > >>>                       iommus = <&ipmmu_vi0 10>;
> > >>>               };
> > >>
> > >> The FCP's added are:
> > >>
> > >>                 fcpf0: fcp@fe950000 {
> > >>                 fcpf1: fcp@fe951000 {
> > >>                 fcpvb0: fcp@fe96f000 {
> > >>                 fcpvb1: fcp@fe92f000 {
> > >>                 fcpvi0: fcp@fe9af000 {
> > >>                 fcpvi1: fcp@fe9bf000 {
> > >>                 fcpvd0: fcp@fea27000 {
> > >>                 fcpvd1: fcp@fea2f000 {
> > >>                 fcpvd2: fcp@fea37000 {
> > >>
> > >> So indeed, the first fcpf0 comes before fe960000.
> > >>
> > >> Do we keep the items grouped by the first occurrence? or sort the nodes
> > >> based on address?
> > >>
> > >> for some reason I thought we were ordering based on address, but I see
> > >> other situations where we group too - so I'm confused (and wishing there
> > >> was an automatic tool to get the sorting correct without fuss).
> > >>
> > >> Is there a set policy?
> > >
> > > For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
> > > similar nodes grouped.  Hence I prefer this v1 over v2.
> >
> > I assume then the groups are sorted by the first entry,
> >
> > I.e. hypothetically:
> >
> > fdp@0
> > fcp@1
> > vsp@2
> > fdp@3
> > fcp@4
> > vsp@5
> > cmm@6
> > cmm@7
> >
> > would become
> >
> > fdp@0
> > fdp@3
> > fcp@1
> > fcp@4
> > vsp@2
> > vsp@5
> > cmm@6
> > cmm@7
>
> Exactly.  That's how we (Reneas SoCs) have been (trying to) doing it.
> I am aware there are some deviations (e.g. do you keep all 4 possible
> SCIF types together (they're all serial@), or do you group them per
> type? And some nodes (ipmmu) may be sorted alphabetically by label).
>
> > Has anyone already created any scripting/validation to automate the
> > sorting requirements?
>
> Not yet, AFAIK. I've been thinking about doing that several times,
> though ;-)
>
> > > [*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.
> > >
> >
> > Personally I prefer that - but my opinion doesn't matter here - so as
> > long as the rules are defined (or even better, automatically
> > enforceable) that's fine.
>
> Indeed.
>
> Perhaps creating rules is something to be handled at a higher level
> (i.e. common for all DTS files)?
>
> Summarizing "our" rules:
>   1. Nodes without unit-address are sorted alphabetically, by node name,
>   2. Nodes with unit-address are sorted numerically, by unit-address,
>        a. Nodes of the same type are grouped together, i.e. the whole
>           group is sorted w.r.t. to other nodes/groups based on the
>           unit-address of the first member of the group.
>   3. Anchors are sorted alphabetically, but anchor name.
>
> Do they make sense?

For comparison, scripts/dtc/dtx_diff uses "dtc -s" for sorting, which
sorts everything (nodes and properties) alphabetically.
While I can agree on sorting all nodes alphabetically, sorting
properties alphabetically goes IMHO a bit too far.  E.g. it's established
practice to put "compatible" and "reg" first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
