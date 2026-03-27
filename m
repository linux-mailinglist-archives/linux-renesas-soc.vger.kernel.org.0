Return-Path: <linux-renesas-soc+bounces-30400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCTDCpQ5xmm7HgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:02:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CAA340B74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE77305541F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD3E3C8734;
	Fri, 27 Mar 2026 08:00:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE03BFE2A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598423; cv=none; b=eiwYmILaKwVb2bQbwpq7ctCePhwcNW/I+fKBzHjLmi7L/u/tOvQBJRkQN694VOippbNRwWQWhMx3B7/NnOjmDNWFy872uDWpQlnD2UXlw7TlwxhvhxcVipwpbnpzgl2reTBZLTb0cSUkpMHQXFFd8fr543hwSrlYkJLL9Kvt68s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598423; c=relaxed/simple;
	bh=LsuoM6vSS2icn4IcCYbHnTFkI9szULOyzJ6/FpfPSuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C++c2LN7hISmH910Yy+XH6AGC3wVX/a1mp3soljqj6iLt7r6bQGwSI+F1h+Gh2dIUK1iasgJVzuyFCsv3mUTNwuyVHKQlgqs9HUz8VrwyLiteaB9l4EeCNb7iulgxKUY4eX8WTAj20tts5cG7qmoE9/Dopf9S9SDTxxqzH1ikvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56cd71a7630so703887e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 01:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598419; x=1775203219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHzybmIOhEZ6f1NrVP3jgghQyfbqKSz0qw+kQmDQIR0=;
        b=qlxYobasZbBGTmcGlK68VUY97QF1jVOJoOH2DQ7A5XSeSjlGRB2N7430g5U5+g/IsZ
         wnpNiCCPMkJUW6/5Xe1erSaZ9jMjRT66Z9LCBVd3o2WViiLEyKxv+KA/El8yQ5o2CLcN
         QI13TFydOMcXJ812qQFiG8+N78hIOo8dksHsNm5daZ1ZBOtKsH6fouonFdUUp6e9LFWP
         AvuTrL7blqigj7RApFUZ//CZDtKkSOKoxV0k+f+YNxOFPFcvjRUHD3THSfuia/eVArqk
         aU79EnnHyruBNT8eLgpcHpY4cIVThQiVrLMhRt1ZhBOpQqv0fPMtlkNNWA599QiTSSOp
         fObg==
X-Forwarded-Encrypted: i=1; AJvYcCXcxeaAzQdo60HaZLlhg6bctECKTDFUpmY0pFm88iTj4ukI8A43aJUnwW4R7JasnVDBGjWfgAsJPmg7wwJZnOb3xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgysU1cVcl9QlDbk60B01xFRQbeoSCB4jaAsG+I5aLc0F/U3B
	Ci1T67raIprAzS85obhyllbj8Ujtdn0OJDiBMhCxAElNHAOIz60I4J9BcqB2yWkMuqc=
X-Gm-Gg: ATEYQzx6DXfVrMCCSJUxz1ee7xoRsSYIrfvQUnhtH/cMUKHFLv4WMRJgSDaS3CcrNgp
	uzWbWJJYk9ZkYCmQHjE0uM/o5AFFM3iRuCUI0qrzD1pDUIv4KIksgbwFhiT8q1zI7yUrch3HchF
	MMsLNfL9ZqXIZnUT1wBUMpGL3XmZo4IdvaD37Eo6gas/UEtGgsiTUyTNAds3Zueqn29k650b276
	ZrIvWPOeBIgFZlwEXRJuNCfZPoH0ognm38XBvtZKyjVwuLMLfquKd4Zn8jAjP04Jc/cnPgr+DwY
	WoQ3GGdqANXIzpkxltif1fM4PoF/Ns8Gwoh+ctk83b+uhb0nZL1jtOxBE1FefYDYppASvedAlez
	LlepNfcOuo/vD1Jz5tYkGzr68/DOxGnE9AavPiivhPp4UcQH4Cy9xcpQ9/oLauccDT8MC26jIYc
	k/bkMGvYLvTiAJwZ699Q++ehsatVoao+ZWTc3X4ekWpHug/eyYDIhVsIdsWHUkvx54
X-Received: by 2002:a05:6122:91d:b0:56d:4511:936e with SMTP id 71dfb90a1353d-56d4a0d53f5mr496606e0c.0.1774598418661;
        Fri, 27 Mar 2026 01:00:18 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31bf74basm8399485e0c.2.2026.03.27.01.00.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:00:17 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56cd71a7630so703866e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 01:00:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJa9wUTP7lLhUSNgT1+/XoI94CcEdZvrR8uYIRnOrJv4Bfj+U2oSxEWq+lCyYIdQLex7o+d2i8pP7pP6IfS/m46g==@vger.kernel.org
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id
 ada2fe7eead31-604f930a02dmr530378137.32.1774598416378; Fri, 27 Mar 2026
 01:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-5-john.madieu.xa@bp.renesas.com> <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
 <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
X-Gm-Features: AQROBzBkJOmSHv5z_VHomTtftX1LPSPJAufke2TB95A8lqe7V-8DI3QQuxsJ7o4
Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RSPAMD_URIBL_FAIL(0.00)[renesas.com:query timed out,linux-m68k.org:query timed out];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,baylibre.com,gmail.com,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30400-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B5CAA340B74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

On Thu, 26 Mar 2026 at 23:42, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com>
> > wrote:
> > > Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> > > ACK signal routing through the ICU. Document the optional second cell
> > > in the DMA specifier for specifying the ACK signal number.
> > >
> > > The first cell remains unchanged and specifies the encoded MID/RID and
> > > channel configuration. The optional second cell specifies the DMA ACK
> > > signal number for peripherals requiring level-based handshaking.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > Just a quick head-up, as I haven't read the actual secion in the
> > documentation yet.
> >
> > > --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > @@ -63,17 +63,27 @@ properties:
> > >        - const: register
> > >
> > >    '#dma-cells':
> > > -    const: 1
> > > -    description:
> > > +    description: |
> > >        The cell specifies the encoded MID/RID or the REQ No values of
> > >        the DMAC port connected to the DMA client and the slave channel
> > >        configuration parameters.
> > > +      Use 1 cell for basic DMA configuration.
> > > +      Use 2 cells when DMA ACK signal routing through ICU is required
> > > +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF,
> > SRC, DVC).
> > > +
> > > +      First cell:
> > >        bits[0:9] - Specifies the MID/RID or the REQ No value
> > >        bit[10] - Specifies DMA request high enable (HIEN)
> > >        bit[11] - Specifies DMA request detection type (LVL)
> > >        bits[12:14] - Specifies DMAACK output mode (AM)
> > >        bit[15] - Specifies Transfer Mode (TM)
> > >
> > > +      Second cell (optional, when #dma-cells = <2>):
> > > +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> > > +                  where 0 is a valid signal number.
> > > +                  Required for peripherals using level-based DMA
> > > +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).
> >
> > How do you expect this to work? #dma-cells applies to all DMA consumers of
> > this provider, and these SoCs already have DMA users relying on #dma-cells
> > being one.
>
> Indeed.
>
> > In addition, you cannot have optional cells: if #dma-cells is two, then
> > all consumers must supply two cells (of course we could switch all of them
> > to two cells at once).  However, as zero is a valid signal number, we
> > cannot use that as a dummy when no DMA acknowledge signal number is needed
> > (we could use e.g. 0xffffffff instead).
> >
> > Is there any other way to provide this information?
> > E.g. could we have a table in the driver that contains this info for the
> > (presumably few) MID/RID values that need it?
>
> There are actually 89 entries, and I could identify 3 peripheral
> group with linear ACK assignments. Thus instead of static array
> we would get a simple function handling 3 req_no ranges.
>
> Something like:
>
> /*
>  * Map MID/RID request number (bits[0:9] of DMA specifier) to the ICU
>  * DMA ACK signal number, per RZ/G3E hardware manual Table 4.6-28.
>  *
>  * Three peripheral groups with linear ACK assignment:
>  *
>  *   PFC external DMA pins (DREQ0..DREQ4):
>  *     req_no 0x000-0x004 -> ACK No. 84-88  (ack = req_no + 84)
>  *
>  *   SSIU BUSIFs (ssip00..ssip93):
>  *     req_no 0x161-0x198 -> ACK No. 28-83  (ack = req_no - 0x145)
>  *
>  *   SPDIF (CH0..CH2) + SCU SRC (sr0..sr9) + DVC (cmd0..cmd1):
>  *     req_no 0x199-0x1b4 -> ACK No. 0-27   (ack = req_no - 0x199)
>  */
> static int rz_dmac_get_ack_no(const struct rz_dmac_info *info, u16 req_no)
> {
>         if (!info->icu_register_dma_ack)
>                 return -EINVAL;
>
>         /* PFC external DMA pins: ACK No. 84-88 */
>         if (req_no <= 0x004)
>                 return req_no + 84;
>
>         /* SSIU BUSIFs: ACK No. 28-83 */
>         if (req_no >= 0x161 && req_no <= 0x198)
>                 return req_no - 0x145;
>
>         /* SPDIF + SCU SRC + DVC: ACK No. 0-27 */
>         if (req_no >= 0x199 && req_no <= 0x1b4)
>                 return req_no - 0x199;
>
>         return -EINVAL;
> }

Nice!

Note that you can use ranges in case statements:

    git grep "case.*\.\.\."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

