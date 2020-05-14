Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E44D1D27F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 08:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgENGgc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 May 2020 02:36:32 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:63749 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgENGgb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 May 2020 02:36:31 -0400
Date:   Thu, 14 May 2020 06:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1589438190;
        bh=TG6q1oVn9yu9TrPo2CgKnbg1pqUklx0m8C5AyvFrsr0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=1vCUkV73e9+2C9vkOYc1D6vdpRtlHdDeQrRHX4cHoHzn8aW/pC5hhzjarnFMWscQa
         EH2CeI6KQACny43AmtwusPMeJ0cjVuLTJawObnMDecKzs8iuotyxHqmQuz3JiX0A1b
         BmlqTDSBIMY3fYF3X4XjDxL8Yy55+HsB7E3o8na8=
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: plane: Verify that no or all planes have a zpos property
Message-ID: <kUdOgrEHV2CISzB4AyQ56o4qMW9CVtrVxs3SqCNbklOk6PczzNKbMnzUBIGgxtcsh4scTiOKQUUzxvca1ES1u6uYITbD1clU-lk7gMPYF-w=@emersion.fr>
In-Reply-To: <20200513225835.19361-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200513225835.19361-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thursday, May 14, 2020 12:58 AM, Laurent Pinchart <laurent.pinchart+rene=
sas@ideasonboard.com> wrote:

> The zpos property is used by userspace to sort the order of planes.
> While the property is not mandatory for drivers to implement, mixing
> planes with and without zpos confuses userspace, and shall not be
> allowed. Clarify this in the documentation and warn at runtime if the
> drivers mixes planes with and without zpos properties.

Thanks for the patch, this looks good to me!

Acked-by: Simon Ser <contact@emersion.fr>
