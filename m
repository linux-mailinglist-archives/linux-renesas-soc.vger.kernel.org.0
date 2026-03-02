Return-Path: <linux-renesas-soc+bounces-28636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFlmEAWNpWmoDgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 14:13:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 992711D9921
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 14:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 296963053B82
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 13:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C1B3D6CC9;
	Mon,  2 Mar 2026 13:09:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8F366DB7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456970; cv=none; b=PdRj7ICKYuIMNVYj5P7Tjpx8jgw+cv1YsjdHMczCL6HfNzK00v3H9709fklHdA0viBIhHwCoqytXVnRwTIX/wGydin1J6iL1xaulh16YVbUzZ/eKsDKL72jkqDGXdod7Vpyt0bf+q8dlKUIwyVDl/wcHddH2Kz/1UGzEwYbj75Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456970; c=relaxed/simple;
	bh=flPzsF7PzOvMEnCHPNRVbaZwyCdjFf5LYGl94bUvKVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLzG9rNGaUfZ4db8Kz+KKl1KtFA83ncoX1MAqF/xjQ9tPb/0AYafZHRCc9uv/nkNgVZksb5c8GUvSOqKnNehyH37qTfKvszo3mKyuJegmLrog72nv3wWw/aAh97fMA0tjZMt6+iVVSGgLsatHVCjJeWm/0IGI1HolKxz5Q2vmm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5675d609621so4175394e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 05:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456968; x=1773061768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbpBDECGTuxrjZK2784Rn4svmYdxHMnNQNyQJ/QvvFQ=;
        b=wkqMGJ16NTO/7QDi39FiZXqXgqj85EzpCYt5/RY8GmVVIImelX+XJDh7/9CNW5YLz2
         PNyz8AgKT1GjYpU3GG5fujhCIXU2rozM/ZIgX8EuSXpnwMXASAKJxc9wtxV7FShTQTh9
         qUgIiFApajJ45CJd9ByoEXxNBeN8qw9KvoxZwSZ5Fd32WM2sQV38irnKGpj1xpFbr7As
         NccZUUDISAOKz1DY3WXODUNJEXABnUSf3+dAaEu8+sV2sYOMEKhcadhN0xHlua+XlenR
         2dDVUaR4rKbu8D9ZwJAXNpfeRFs6VNBavGLNc8D+mZEq4LKJ55Hn9AjbIgYZwV7Z1Zyr
         e3ww==
X-Forwarded-Encrypted: i=1; AJvYcCUnjhYntlkuo3y464sHErj0sqLkF47BYaxhH1xf19fKN3a0rA/O74yYCZVF4kXwko7DXyx0K0rnQhD/r2iukXry6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwLDTWKkSVHQC7fELOhKYIdAPstn9SQaytQjH90P0tp5B7QM1
	Bjd6uAkRGBlLmqSLQt94PtIKT254Tu3p5aLo7i9p665dyJXouSNt30hYLhJ2aOqI
X-Gm-Gg: ATEYQzxT42vkoUKcloN36GVFdoBjfwqQBrGowfHt4v7Ym3EVZmUi38uDpgrwyxsjgHD
	kOUN9Jc7vkvhMEpC5WYfJ3Gej4ZIJ4hJO35QNKdTXJXQ7CZFITZQTKxAZlKHAyQb4mS9K4kf25M
	0+tx7Bv46R6RrfZ2Msap9YTkTKqAIwXLr4zgsjrarg45ki1j9iEYBEId10/AbqUqBnwczgzDsYW
	11caU9Gdaj5a3ChlvcczQTGg2EFh/EfJ5gHcKaL6EWBGadI+uKnTnXiucMjGWBI1ivlh4IsH3jR
	rFlxlN9ONgVYS52u4OgMUAl6sABYEgva6go5lh7+JKGrBuTmLWjnq8nHY/0570LARNruKlqprnp
	IYKCEzyExDNGzRfA1ZkoKqG2Ex2qwjA5JIBomMuC7IvsvXewjdL2cYCeWFEzQi01q7x8C9r3+/C
	wtI+xx56JxOlNhvW53NADhrpUnFSqIbNgUOSp17TZsmdQLCZhZUJayOpqfM06f
X-Received: by 2002:a05:6122:d04:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-56aa09ec812mr5968937e0c.4.1772456968181;
        Mon, 02 Mar 2026 05:09:28 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb97absm15252106e0c.6.2026.03.02.05.09.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:09:27 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ff1699312bso2637557137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 05:09:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSlXWDbLnSsgxg0PaCCOPFQxVsv2nofv7Wjdwvul4EG4Z4J14Lb1q3mrw+hx8PkAL1IA0GW/aSxm434lSjQXNyIw==@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6199626137.27.1772456966817; Mon, 02 Mar 2026
 05:09:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com> <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
In-Reply-To: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:09:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
X-Gm-Features: AaiRm50gWrUOn4xlq8V0dsaXBHr2iE-RWJy6NrWL5o5U_z-q0G3KqmZt-0p4hrs
Message-ID: <CAMuHMdVwVsYxsQj+du-uEN77H6UHDVFO4T6-_7VJ0E4Pfa=sSg@mail.gmail.com>
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	TAGGED_FROM(0.00)[bounces-28636-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.623];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 992711D9921
X-Rspamd-Action: no action

Hi Cristian,

On Mon, 2 Mar 2026 at 13:48, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Move needlessly exposed fields away from scmi_clock_info into the new
> > internal struct scmi_clock_desc while keeping exposed only the two new
> > min_rate and max_rate fields for each clock.
> >
> > No functional change.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> >         __le32 rate_high;
> >  };
> >
> > +struct scmi_clock_desc {
> > +       u32 id;
> > +       bool rate_discrete;
> > +       unsigned int num_rates;
> > +       u64 rates[SCMI_MAX_NUM_RATES];
> > +#define        RATE_MIN        0
> > +#define        RATE_MAX        1
> > +#define        RATE_STEP       2
>
> Any specific reason you are not using a union here, like in
> scmi_clock_info?

Ah, "[PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
dynamic" answers that.

>
> > +       struct scmi_clock_info info;
> > +};
>
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -51,6 +51,8 @@ struct scmi_clock_info {
> >         bool rate_ctrl_forbidden;
> >         bool parent_ctrl_forbidden;
> >         bool extended_config;
> > +       u64 min_rate;
> > +       u64 max_rate;
> >         union {
> >                 struct {
> >                         int num_rates;
>
> You patch description read like the actual rates would be moved
> from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?

And these members are actually removed in "[PATCH 05/11] firmware:
arm_scmi: Drop unused clock rate interfaces".  Please reflect that in
this patch description.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

