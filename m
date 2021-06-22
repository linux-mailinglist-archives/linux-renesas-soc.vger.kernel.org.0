Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBFF3AFEB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 10:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFVIH6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 04:07:58 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:38297 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhFVIHs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 04:07:48 -0400
Date:   Tue, 22 Jun 2021 08:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1624349095;
        bh=G/pZPGLWw8xPSg8u+BnvKpg8hIZxfrEr5BbzpiNsjQg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=rwqQro6mDrG9kKTjG3V2SpTlO6BpBippD85BtqfjPO7UyuMnI/Upvunw+n9KLmjZQ
         bkatLZKLE1/a4OP9IKEW+LaFp2qpV8cJlVrfJ2HiDN7P8YumO+MKElHDBpaLK2fCW6
         aHZbJRq9vR8mh0e0TpQqaOTX0TJ0whzQqbgG9jeAnuObuV6MLmU6EYd9wd267WbXkS
         uFhxXngauc+dozk3SJPDSp4MVSlCjHuUso6b8ksA4iiA3ZuZba5GZAByIrHcuc3MhV
         UUsYe2X8NJxrpKD7QKIMMsnwceNQACzB/H1YESSpdklfKtepwbtt8/UOlg8auQC8ro
         4Ll0lsI5GIUIg==
To:     Tomohito Esaki <etom@igel.co.jp>
From:   Simon Ser <contact@emersion.fr>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <08kxmstH-uYXe0-6PB5pM0R4Ng9s8AKF4IUiqVzHUDVR3eztlXVsNCY_syeRm6ItQtYAqUysd2NxbeF9YYY4NgwEjPEgIUza7BtuGYmFoI4=@emersion.fr>
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Monday, June 21st, 2021 at 08:43, Tomohito Esaki <etom@igel.co.jp> wrote=
:

> Virtual DRM splits the overlay planes of a display controller into multip=
le
> virtual devices to allow each plane to be accessed by each process.
> This makes it possible to overlay images output from multiple processes o=
n a
> display. For example, one process displays the camera image without compo=
sitor
> while another process overlays the UI.

Updating the KMS state from multiple processes doesn't sound like a
good idea. This opens up synchronization and global device limits
issues.

Are you aware of DRM leasing?
