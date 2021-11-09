Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F211944AA29
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 10:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244704AbhKIJMg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 04:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244684AbhKIJMf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 04:12:35 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C7BC061764
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Nov 2021 01:09:49 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e11so15712782ljo.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Nov 2021 01:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kus4q4w/MRHo7vb0zRbS2VwR79Spya1yRC0ArOdsenE=;
        b=ZWZnKj77Bb0zN+NtDHkcLIakxLUogbyA7v7+ivtezp4n4NuGhNWL6tJEsoUAl4X2Rz
         zEK5cQWJwG//muWN+ClyrRUkHFSKzTZ8sb3zWMYQGRfiyDXmY9RRibc2pA5/NwWi1cSH
         i50S/3hrwkOVmnWp6TgVRLIptDNgAKE66Nszt8RzaMrsQPBJ87+2h2YAvlIl2W68c2CG
         Tl5dlw4nQrbdXgZAlIuQnhOJ7O2PC+AJeaAxU1Rv1eHInQsjVlHrxAtnItoeCncXvqRB
         FSelqX4zqam4rHbF6NNFRtJrMmlIridh9KAvX+00U53pz0Tq8iMAsUJ6FKMiI3netaA1
         hGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kus4q4w/MRHo7vb0zRbS2VwR79Spya1yRC0ArOdsenE=;
        b=NaerGPq1frVhC/cJU6IVDHjBSKw9uw2GnLK2F88yHw8cFVBVsqq/Fwb1mSrQdx9jcW
         VzT86VCvlTE2E4kn+vDMsClUa9ms1Y3WfwOmJzo4vC2okunV0IfnUv2U+J4IWylutgFN
         AMLSUZRPGXr0wTjxuimkDhQfFcIWisVb7IO9Kch9cX761YkzT5WaPLZvJgQshsVUZgWA
         04IxyxLWxqpXl7jfI668fL2YDKWzYSHw5RIqkHceecPhhMxchDOmrVSVIGJRh5vsH0gq
         mg4YCp+lzkKdc0IDHQxWuJG6zkuSOb+VgfPCEjVq2VvCKcIomF1V0pRO8YM04vDkqQpC
         eGsg==
X-Gm-Message-State: AOAM532H3rBJIfyv1juXewTqBzWwHYpolI6mir8u2tcgk7JnYOmAlhkM
        xlxZELBruhBzijchE3ZliVxV/w==
X-Google-Smtp-Source: ABdhPJwcrEHsK3imEHQJg0uuHq01I7FN9FrVAlluvNnoCcfBvfbVXKgX5owLubLXvq2Tmmtz0wAeQg==
X-Received: by 2002:a2e:8515:: with SMTP id j21mr5531503lji.531.1636448987671;
        Tue, 09 Nov 2021 01:09:47 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id d11sm191292lfq.303.2021.11.09.01.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 01:09:47 -0800 (PST)
Date:   Tue, 9 Nov 2021 10:09:46 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/9] arm64: dts: renesas: Thermal binding validation
Message-ID: <YYo62jdzSTxqCMtk@oden.dyn.berto.se>
References: <20211104224033.3997504-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdXVBj58ZM3LqCN3cudsE3VJV8AQC5OCOJP96RaqYf4NDQ@mail.gmail.com>
 <YYo0syH9m/CYlB2d@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYo0syH9m/CYlB2d@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2021-11-09 09:43:33 +0100, Niklas Söderlund wrote:
> > > linux/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dt.yaml: 
> > > thermal-zones: sensor3-thermal:cooling-maps:map0:contribution:0:0: 
> > > 1024 is greater than the maximum of 100
> > >         From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> > >
> > > This validation error appears to be pervasive across all of these
> > > bindings, but changing that will be more invasive and require someone to
> > > perform dedicated testing with the thermal drivers to ensure that the
> > > updates to the ranges do not cause unexpected side effects.
> > 
> > Niklas?
> 
> I will have a look. The thermal driver is the one driver where I have 
> automated CI test running.

So the core of the issue is that the definition of the property changed 
in the txt to yaml conversion. The original definition was,

  Optional property:
  - contribution:         The cooling contribution to the thermal zone of the
    Type: unsigned        referred cooling device at the referred trip point.
    Size: one cell        The contribution is a ratio of the sum
			    of all cooling contributions within a thermal zone.

While the  new binding states,

  contribution:
    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 0
    maximum: 100 
    description:
      The percentage contribution of the cooling devices at the 
      specific trip temperature referenced in this map 
      to this thermal zone

Looking at the real world usage of this only 2 out of 17 platforms sets 
a contribution value less or equal to 100. I will send a patch to fix 
the bindings.

-- 
Kind Regards,
Niklas Söderlund
