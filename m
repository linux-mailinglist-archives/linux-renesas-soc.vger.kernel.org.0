Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E621F3538C9
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Apr 2021 18:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhDDQHv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Apr 2021 12:07:51 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:41740 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDQHv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Apr 2021 12:07:51 -0400
Received: by mail-lf1-f42.google.com with SMTP id b14so14192501lfv.8;
        Sun, 04 Apr 2021 09:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=tYWPzktRNhlo2hKZklT8vMqlf1tJ/zdHiLRJaE5qlxc=;
        b=I1rgo8nbqckVnwhtWuic6AcD5tnlRfJY8T6hWcH1Hn07Yhf8MiQ9jV5DIktk1FC7KW
         iYJNirLLj4nbakm7WJLmA2cCCfn8jyQpmlBO0Iin26YIX5KESWgfdHIzXclFV2xVMGA7
         Xh1j0UM0+zHqHr9DNjIpj7hr3YOSZFCD8R/P05KRmW40x/Q3NA8To5g76INFE07UxDxm
         c4rpHvT07tGs0v23xb1hE/f7pgQU1LA9lmaaCViPvgQffZYGPzZBd3kOkBTRe5y4L68N
         7sUEMPqF+aaWLtwwSGSiT4ICSfNnZkFG3+IRraiMMA/tJe0LHosLbuomoXSVBxG9+ULk
         kAzA==
X-Gm-Message-State: AOAM531WHvYcdG5bHWPKLkOaTS74wzEANVI0pCZhB9UP4Fz+afHaLpKe
        zdr+woRcE68uRlBoicllB+4=
X-Google-Smtp-Source: ABdhPJyK1g8PXU7JR6o5sQXa8+MpMUEMRgKrJufsH10kY0yWaz57HVWKol/wn5168PzKrovieoczGg==
X-Received: by 2002:ac2:4e91:: with SMTP id o17mr16132923lfr.588.1617552465024;
        Sun, 04 Apr 2021 09:07:45 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id u18sm1480866lfu.103.2021.04.04.09.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 09:07:44 -0700 (PDT)
Message-ID: <15f550542c1c9e808f0ab40ec3032a1408d57c14.camel@fi.rohmeurope.com>
Subject: Re: [RFC PATCH v3 3/7] regulator: IRQ based event/error
 notification helpers
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <20210402171139.GB5402@sirena.org.uk>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
         <0acca88796cab147398dbc346b3ea9728a9e3238.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
         <20210402171139.GB5402@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Sun, 04 Apr 2021 19:07:39 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


On Fri, 2021-04-02 at 18:11 +0100, Mark Brown wrote:
> On Thu, Mar 11, 2021 at 12:22:36PM +0200, Matti Vaittinen wrote:
> > +	if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
> > +		if (d->die)
> > +			ret = d->die(rid);
> > +		else
> > +			BUG();
> > +
> > +		/*
> > +		 * If the 'last resort' IC recovery failed we will have
> > +		 * nothing else left to do...
> > +		 */
> > +		BUG_ON(ret);
> 
> This isn't good...  we should be trying to provide more system level
> handling of this, if nothing else it's quite possibly not a software
> bug
> here but rather a hardware failure.  An explicit message about what
> happened would be more likely to be understood as a hardware failure,

I do agree. I'll add a print in next version.

> and something which allows handling such as initiating a system
> shutdown
> would be good as well - I'm not sure if there's any existing
> mechanism
> to plumb userspace into, or perhaps some sort of policy configurable
> via
> sysfs.

I like the idea but don't know of such existing mechanism. The input
system power-key event is closest that comes to my mind - but I don't
think that would be quite right. Additionally, I am unsure what level
of user-space functionality can be expected to work? Maybe the severity
of configured notifications should be used to decide whether to do in-
kernel handling or to alert user-space. Anyways, that is something that
requires further pondering - I'd propose improving this later.

Best Regards
	Matti Vaittinen

