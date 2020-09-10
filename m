Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79C2264534
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 13:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgIJLNR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 07:13:17 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40926 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730413AbgIJLJ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:09:28 -0400
Received: by mail-oi1-f193.google.com with SMTP id t76so5514693oif.7;
        Thu, 10 Sep 2020 04:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHyLYBCvV/QBPG8y5LyMG37sKoWK6MV97mkGdWUv8vs=;
        b=eFp8JL4zPppzTfa738UVSolQO1BPXQn3Ur0vBE6eaIZzWMNlKOiihaGmIW+aa6nUB+
         af09Kbv4b9aq0ZJ8wE2g9wAapCadfuiIeygAkdjHgPanj7XVAdtf+LmzVhROyl5QE6Qm
         NCLeSwEN4wvPd7oqbB6W0zFNcZ62DlgVHjEIR30/vJRvESZu4wuTjGijiXxCyk+z6lf+
         26kC6CDgWl5dBVFzALpz2zIHWGbO4oab7Li+xdIjo0DOznQHJTA0phNVKtn53jUA1hhL
         f4SU2U0avYJ4nAYYg8qJ5nBK03qHwlmBnLtqQSFb3A1XuOBK1x58edLa6LHRm1GZ2vE9
         TXGw==
X-Gm-Message-State: AOAM532f4HVprQfGePSfF/1H9k6hA3bUafZtdqbBeG9ncZJcnq93UMm/
        uPianON/FE/AcM21KDnNlky7CtYoPiXtJARfgJ4vLZTj
X-Google-Smtp-Source: ABdhPJyRR/8Bfk+8m5dk07edfLMGgniqflKGYa4vK8RrPJXBSGfpDUqz8PGEAe2B9sDx97OhvfrRJ65SBY8tODhzOjw=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr3377102oib.54.1599736163569;
 Thu, 10 Sep 2020 04:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com> <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
 <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com> <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com>
In-Reply-To: <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 13:09:12 +0200
Message-ID: <CAMuHMdVGFOaBFCejGDgzf8AUbHFis0TOM-DDJ3h9k0+fuu=umQ@mail.gmail.com>
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

Hi Kieran,

On Thu, Sep 10, 2020 at 12:34 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 10/09/2020 10:44, Geert Uytterhoeven wrote:
> > On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> >> On 07/09/2020 03:59, Kuninori Morimoto wrote:
> >>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>>
> >>> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> >>> This patch is test on R-Car M3-W+ Salvator-XS board.
> >>>
> >>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>> ---
> >>>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
> >>>  1 file changed, 55 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> >>> index fe0db11b9cb9..c2a6918ed5e6 100644
> >>> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> >>> @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
> >>>                       iommus = <&ipmmu_vi0 10>;
> >>>               };
> >>
> >> The FCP's added are:
> >>
> >>                 fcpf0: fcp@fe950000 {
> >>                 fcpf1: fcp@fe951000 {
> >>                 fcpvb0: fcp@fe96f000 {
> >>                 fcpvb1: fcp@fe92f000 {
> >>                 fcpvi0: fcp@fe9af000 {
> >>                 fcpvi1: fcp@fe9bf000 {
> >>                 fcpvd0: fcp@fea27000 {
> >>                 fcpvd1: fcp@fea2f000 {
> >>                 fcpvd2: fcp@fea37000 {
> >>
> >> So indeed, the first fcpf0 comes before fe960000.
> >>
> >> Do we keep the items grouped by the first occurrence? or sort the nodes
> >> based on address?
> >>
> >> for some reason I thought we were ordering based on address, but I see
> >> other situations where we group too - so I'm confused (and wishing there
> >> was an automatic tool to get the sorting correct without fuss).
> >>
> >> Is there a set policy?
> >
> > For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
> > similar nodes grouped.  Hence I prefer this v1 over v2.
>
> I assume then the groups are sorted by the first entry,
>
> I.e. hypothetically:
>
> fdp@0
> fcp@1
> vsp@2
> fdp@3
> fcp@4
> vsp@5
> cmm@6
> cmm@7
>
> would become
>
> fdp@0
> fdp@3
> fcp@1
> fcp@4
> vsp@2
> vsp@5
> cmm@6
> cmm@7

Exactly.  That's how we (Reneas SoCs) have been (trying to) doing it.
I am aware there are some deviations (e.g. do you keep all 4 possible
SCIF types together (they're all serial@), or do you group them per
type? And some nodes (ipmmu) may be sorted alphabetically by label).

> Has anyone already created any scripting/validation to automate the
> sorting requirements?

Not yet, AFAIK. I've been thinking about doing that several times,
though ;-)

> > [*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.
> >
>
> Personally I prefer that - but my opinion doesn't matter here - so as
> long as the rules are defined (or even better, automatically
> enforceable) that's fine.

Indeed.

Perhaps creating rules is something to be handled at a higher level
(i.e. common for all DTS files)?

Summarizing "our" rules:
  1. Nodes without unit-address are sorted alphabetically, by node name,
  2. Nodes with unit-address are sorted numerically, by unit-address,
       a. Nodes of the same type are grouped together, i.e. the whole
          group is sorted w.r.t. to other nodes/groups based on the
          unit-address of the first member of the group.
  3. Anchors are sorted alphabetically, but anchor name.

Do they make sense?

> >>> +             vspb: vsp@fe960000 {
> >>> +                     compatible = "renesas,vsp2";
> >>> +                     reg = <0 0xfe960000 0 0x8000>;
> >>> +                     interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> >>> +                     clocks = <&cpg CPG_MOD 626>;
> >>> +                     power-domains = <&sysc R8A77961_PD_A3VC>;
> >>> +                     resets = <&cpg 626>;
> >>> +
> >>> +                     renesas,fcp = <&fcpvb0>;
> >>> +             };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
