Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260F1220AB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 13:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731374AbgGOLHe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 07:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731367AbgGOLHd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 07:07:33 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43159C08C5DB
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 04:07:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so2137578wrs.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 04:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GTboRADciARmdKmdVFydQyO6bXaLy3+gjZbuS1AHoC8=;
        b=cSCU0QwPwPrx+oUmwUcrBy+AJrFWX8fH6PaZc0B9o1iG9gYnarHJcJZYxFa6hETjfy
         OsltWCkl4ZVixyuVBlo55HpfWI8Uou3za6pDTKAWOyX9+Tit4MXhxChS8YQjphMMf0pq
         KNCU535HeeFoimkLPqAK4GFRJieEj8EL0FBSZQ6Sw4psI/ualNK/YcMlzrwkRooOl1eP
         aAn8OJCRFRYZyHLTm0wOKLGTi+9CnsKmrRSMmGmbDR93sS1BVDNTucn3T+1Vws91pNSf
         p1D1N7MAhESo2tQdrUJxHByVs3JDl3ygR6sJxPMSRMAS2g/1WZz+pHb6HJJ9YGdj4dTx
         M2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GTboRADciARmdKmdVFydQyO6bXaLy3+gjZbuS1AHoC8=;
        b=rFVr46KobefCiMiWZxC2GFgCXOqhD6FbbviQSxq06CAapAjXy31SSxTkCnAyuRWN22
         KXic9Ds/W1x2IEvfvUYN2kIZ4mkITCOXASQfV7c9pF6WymI4/r4Nos0f1EG3kVf7jqzf
         6jI+hM4lSTHHruHxOHiuy97JhPEYGAyPPkvJ9WP9N64JPWgHbfAx0mGBusHyM6TyCyFF
         nCXCjYeLDI1DACJo1b/fUTfy+ZbJWnqtyB0I7COoln+lTWO6zMBA7ND/RWZsBxLMTU41
         AZXDX/rAbGlvK8f9yid8d6vCyOiIGf/ENREevuDNRgu+ijmY2vCnd5JFWXK9d7zqoOSC
         LK2w==
X-Gm-Message-State: AOAM533TAf4qI+ENZs/xH01BPTT4Kqe6rB6/1Ah/v2c0/1/dFKiBH8EB
        JajqEwMlfjnBK4WA9/WqP1ciTf5XmBhVPRssY1sAtA==
X-Google-Smtp-Source: ABdhPJwzAgUIUleJj5LWllzXl8a6BgBBQ3QR00OyWhWPExp1qNrqh/cfBfu+ITu1FqNaf8QrwAcuirMUQrpr6TsQU4E=
X-Received: by 2002:adf:81c7:: with SMTP id 65mr10271163wra.47.1594811250937;
 Wed, 15 Jul 2020 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 15 Jul 2020 12:07:16 +0100
Message-ID: <CAPY8ntAmNoLBumgrwFqLtBU_zHAgxOW6=KY=fDndJtXC42F6XA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dt-bidings: media: ov5647 bindings + small fix
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dongchun.zhu@mediatek.com, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo

On Tue, 14 Jul 2020 at 15:25, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> I have added Rob's tag to patches [1/3] and [2/3].
>
> I have added to patch [1/3] an entry for the yaml binding file to MAINTAINERS
> and added a new patch which removes the existing maintainers of the driver,
> as his email address bounces back, and replaced it with myself.
>
> I hope this is not rude, but I have no way to contact Luis Oliveira and
> ask him, and a bouncing email is not that helpful.
>
> Dave, would you like to be added as maintainer as well, as this sensor
> is the one used by the RPi Camera Module v1 ?

I'm happy to be. I had said I would to Sakari when he went to orphan
it, but I didn't get around to sending the email (I've not set up git
send-email since recent changes to our email setup).

  Dave

> Thanks
>   j
>
> Jacopo Mondi (3):
>   dt-bindings: media: ov5647: Convert to json-schema
>   dt-bindings: media: i2c: Document 'remote-endpoint'
>   media: MAINTAINERS: ov5647: Add myself as maintainer
>
>  .../devicetree/bindings/media/i2c/imx219.yaml |  5 ++
>  .../devicetree/bindings/media/i2c/ov5647.txt  | 35 --------
>  .../devicetree/bindings/media/i2c/ov5647.yaml | 82 +++++++++++++++++++
>  .../devicetree/bindings/media/i2c/ov8856.yaml |  5 ++
>  MAINTAINERS                                   |  3 +-
>  5 files changed, 94 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.yaml
>
> --
> 2.27.0
>
