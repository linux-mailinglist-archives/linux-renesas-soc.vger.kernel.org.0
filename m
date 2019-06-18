Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632864A061
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 14:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfFRMKW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 08:10:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46041 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfFRMKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 08:10:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so13640917wre.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+6zc6WbTP5poyzPjTzRIwuO80xZpH5JaHn8Oyp9244A=;
        b=KA5BEjEZz9dXxi/TcfuvvZ7HbGnjoIyU3K0xRxTBlylDNS3iUgZkg6TPWot5dvs1cp
         l5/i0K3QKQiwx9u1E+6sgV7wrfmDL9YeDTWEg82vE77/fA27kpePcVYfjto8C09JKDz/
         dMT6JW6RHuzPLcmt32FKW2sgcQEo8qP2uhE8St4Q+tMp4TRmTMu8eo4WyzAxd8XMJnGM
         pWdD4WGhAR76bybFC1KYTVN8vK3Btm8hdBPMtdEMGlQQlNl2cLS9DQIbYkqXL0hI08l3
         9ROgTxKaiBbZw5Ry6745AKgwHh4ERLlUFjmUqm9ElGlOvnAQZdAVDGsGZuqpDKtgofnb
         1PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6zc6WbTP5poyzPjTzRIwuO80xZpH5JaHn8Oyp9244A=;
        b=FoGIO8iil8Hf/Lsaw9mPjsiUHIK9/Cf1w133evIRG2TM0xhjLCZHLlhX+fr5XKW9iL
         cMTrpJSBD5tXyCcdfE+tZfgsP+4i6zfyjxOhXWo9Bn8A6nczNLSFSBa3VZL90ugWlZ0x
         Cl3chv5kCLF6axyw+ibQj4hjTsASrQP3QXDPh2kzmX2ZDlbAxyZtWjfLeJrXqBYjbZDz
         18EPIwDDvjh7QHIgJIrCUXStxoscjUKeIbmwJxsJz5NknzoZ/MgrK8xoPYnyPVYlEpKK
         ImvMYaUyGOsNM7pb1AIbStY7zO9dpRfWsu8Y7idSKLJ2Ky6ocsW5ibL1aRQci9Pa10EH
         LObg==
X-Gm-Message-State: APjAAAUCyTj2cyxWhoJbBsNafqv3qhv3OL4/9IcVffqmg83jUBWTlyjw
        F02mVTkw9DrqgQVmeU9uza6A6PSumLoZvRALUNS07Q==
X-Google-Smtp-Source: APXvYqzsM4tq2R+WwnTgMgDC0xNJgZ/5R6+n3M9VhRn9qBVAAKsE0aalTzsqm74ONBtsuqRbaNqKQX9g7pfL2EGGGRI=
X-Received: by 2002:adf:81c9:: with SMTP id 67mr10292024wra.62.1560859820481;
 Tue, 18 Jun 2019 05:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <156076300266.5827.16345352064689583105.sendpatchset@octo> <20190618104557.cw2wj3uffzo5r4wx@verge.net.au>
In-Reply-To: <20190618104557.cw2wj3uffzo5r4wx@verge.net.au>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 18 Jun 2019 21:10:08 +0900
Message-ID: <CANqRtoQwnOJPaOR-ftQ+RibTbMNEAaBfp6Vy-4vipzOUx4aPKw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: Minor CMT update for 32-bit ARM SoCs
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 7:46 PM Simon Horman <horms@verge.net.au> wrote:
>
> On Mon, Jun 17, 2019 at 06:16:42PM +0900, Magnus Damm wrote:
> > ARM: dts: Minor CMT update for 32-bit ARM SoCs
> >
> > [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
> > [PATCH 2/3] ARM: dts: Update CMT1 DT compat strings on sh73a0
> > [PATCH 3/3] ARM: dts: Add CMT0 and CMT1 to r8a7792
> >
> > These patches modify CMT device support on r8a7740, sh73a0 and r8a7792.
> > In particular r8a7740 and sh73a0 get their DT compat strings updated
> > and r8a7792 gets a fresh set of CMT devices.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > ---
> >
> > Patch 1 and Patch 2 depend on the following DT binding change:
> > [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
>
> Hi Magnus,
>
> Do these also depend on a driver update to avoid a regression?

Hi Simon,

Nope, there are no driver dependencies for this series!

Thanks for your help,

/ magnus
